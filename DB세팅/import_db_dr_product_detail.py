# 2025.08.12 이경욱
# csv파일 Oracle DB에 Import하는 py
# pandas, oracledb 라이브러리 설치 (아래 실행)
# pip install pandas oracledb
# oracle - instantclient 19 버전 설치 필요
# https://www.oracle.com/kr/database/technologies/instant-client/downloads.html
# 압축풀어서 instantclient_19_28 폴더를 12번째 줄처럼 C:/oracle폴더안에 넣어주세요.
# 실행전 DELETE FROM DR_PRODUCT_DETAIL; 오라클SQL 진행! 필수

import pandas as pd
import oracledb

oracledb.init_oracle_client(lib_dir=r"C:\oracle\instantclient_19_28")

# oracle 계정 설정
USER, PWD = "team1_ict05", "yaksok"
HOST, PORT, SERVICE = "192.168.0.69", 1521, "xe"
conn = oracledb.connect(user=USER, password=PWD, dsn=f"{HOST}:{PORT}/?service_name={SERVICE}")
cur = conn.cursor()

# 테이블별 CLOB 컬럼 (DDL 기준, 데이터로 추정하지 않기!)
TABLE_CLOB_COLS = {
    "DR_PRODUCT_DETAIL": ["INTAKE_HINT1", "MAIN_FNCTN", "BASE_STANDARD"]
}

# csv 파일 : 테이블명 매핑
# csv 파일은 파일 위치
csv_table_map = {
    r"dr_product_detail.csv": "DR_PRODUCT_DETAIL"
}

for csv_path, table_name in csv_table_map.items():
    print(f"▶ {csv_path} → {table_name} 적재 중...")
    df = pd.read_csv(csv_path, encoding="utf-8-sig", low_memory=False)
    if df.empty:
        print("⚠ 데이터 없음"); continue
    df = df.fillna("").astype(str)

    # 1) 항상 스키마 기반으로 LOB 분리
    lob_cols = [c for c in df.columns if c.upper() in set(TABLE_CLOB_COLS[table_name])]
    non_lob_cols = [c for c in df.columns if c.upper() not in set(TABLE_CLOB_COLS[table_name])]

    # 2) 바인딩 순서: 비-LOB → LOB (중요!)
    ordered_cols = non_lob_cols + lob_cols
    df = df[ordered_cols]

    # 3) SQL (컬럼명은 큰따옴표로, 바인드명은 그대로)
    col_list = ", ".join([f'"{c}"' for c in ordered_cols])
    placeholders = ", ".join([f":{c}" for c in ordered_cols])
    sql = f"INSERT INTO {table_name} ({col_list}) VALUES ({placeholders})"

    # 4) CLOB 타입 명시
    if lob_cols:
        bindsizes = {c: oracledb.DB_TYPE_CLOB for c in lob_cols}
        cur.setinputsizes(**bindsizes)

        # CLOB 섞이면 안전하게 row-by-row (원하면 executemany도 가능하지만 안정성 우선)
        for row in df.to_dict(orient="records"):
            cur.execute(sql, row)
    else:
        cur.executemany(sql, df.to_dict(orient="records"))

    conn.commit()
    print(f"✅ {len(df)}건 적재 완료")

cur.close()
conn.close()
