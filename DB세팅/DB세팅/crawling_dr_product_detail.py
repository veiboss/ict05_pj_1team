import pandas as pd
import requests
from itertools import count

# 2025-08-06 이경욱
# 식품의약품안전처_건강기능식품정보 - 건강기능식품 상세정보조회
# pip install pandas requests
# 이 파이썬코드 있는 폴더안에 저장됨 그 폴더에서 바로 oracle로 import할거임 

accessToken = "iIqO2%2B3b9tu0YEreAcQCDedwGqhoQ6AidhGL9YomIaT18Kn4EEZc28R%2Fqn4TzXY%2BeUl2N7Q7QCIhSZ2Jio6tOA%3D%3D"
pageSize = 100
totallist = []

for pageNumber in count():
    url = "http://apis.data.go.kr/1471000/HtfsInfoService03/getHtfsItem01?"
    url += "serviceKey=" + accessToken
    url += "&pageNo=" + str(pageNumber + 1)  # pageNo는 1부터 시작
    url += "&numOfRows=" + str(pageSize)
    url += "&type=json"
    print(f"[{pageNumber+1} page] {url}")

    try:
        response = requests.get(url)
        jsondata = response.json()
    except ValueError:
        print("⚠️ JSON 디코딩 실패 - 응답 내용:", response.text)
        break

    try:
        datalist = jsondata['body']['items']
        for data in datalist:
            totallist.append(data['item'])
    except Exception as err:
        print("✅ 데이터 수집 완료 (마지막 페이지)")
        break

# CSV 저장
filename = 'dr_product_detail.csv'
myFrame = pd.DataFrame(totallist)
myFrame.to_csv(filename, index=False)
print("📁 저장 완료 =>", filename)
