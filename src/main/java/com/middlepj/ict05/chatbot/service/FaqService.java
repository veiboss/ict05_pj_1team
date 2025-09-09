package com.middlepj.ict05.chatbot.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.middlepj.ict05.chatbot.dao.FaqMapper;

@Service
public class FaqService {
    private final FaqMapper faqMapper;
    public FaqService(FaqMapper faqMapper){ this.faqMapper = faqMapper; }

    @Transactional(readOnly = true)
    public List<String> suggestions(int limit){
        return faqMapper.listTitles(Math.max(1, Math.min(limit, 20)));
    }

    // FAQ 정확 일치 시에만 답변, 없으면 null
    @Transactional(readOnly = true)
    public String answerFromDb(String userText){
        if (userText == null) return null;
        String q = userText.trim();
        if (q.isEmpty()) return null;

        String ans = faqMapper.findContentByExactTitle(q);
        if (ans == null || ans.isBlank()) return null;

        // <br> → 개행, 나머지 태그 제거
        ans = ans.replaceAll("(?i)<br\\s*/?>", "\n")
                 .replaceAll("<[^>]+>", "")
                 .trim();
        return ans;
    }
}
