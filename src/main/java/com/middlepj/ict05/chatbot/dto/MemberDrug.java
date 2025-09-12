package com.middlepj.ict05.chatbot.dto;

import java.util.Date;

public class MemberDrug {
    private Long  mbdId;          // MBD_ID
    private Long  mbId;           // MB_ID (회원 PK)
    private Long  drId;           // DR_ID (있으면 의약품 참조)
    private String drugName;      // MBD_DRUG_NAME
    private String drugEffect;    // MBD_DRUG_EFFECT (CLOB → String 매핑)

    private Long  writerId;       // MBD_WRITER_ID
    private Date  regDate;        // MBD_REG_DATE
    private Long  modifyId;       // MBD_MODIFY_ID
    private Date  modifyDate;     // MBD_MODIFY_DATE

    public Long getMbdId() { return mbdId; }
    public void setMbdId(Long mbdId) { this.mbdId = mbdId; }
    public Long getMbId() { return mbId; }
    public void setMbId(Long mbId) { this.mbId = mbId; }
    public Long getDrId() { return drId; }
    public void setDrId(Long drId) { this.drId = drId; }
    public String getDrugName() { return drugName; }
    public void setDrugName(String drugName) { this.drugName = drugName; }
    public String getDrugEffect() { return drugEffect; }
    public void setDrugEffect(String drugEffect) { this.drugEffect = drugEffect; }
    public Long getWriterId() { return writerId; }
    public void setWriterId(Long writerId) { this.writerId = writerId; }
    public Date getRegDate() { return regDate; }
    public void setRegDate(Date regDate) { this.regDate = regDate; }
    public Long getModifyId() { return modifyId; }
    public void setModifyId(Long modifyId) { this.modifyId = modifyId; }
    public Date getModifyDate() { return modifyDate; }
    public void setModifyDate(Date modifyDate) { this.modifyDate = modifyDate; }
}
