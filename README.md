# ict05_pj_1team
# 프로젝트 협업 가이드

## 브랜치 전략
- `main`: 배포용 (보호됨, 직접 push 금지)   # 실제 서비스/배포에 쓰이는 최종 브랜치
- `dev`: 통합 개발 브랜치 (보호됨, 직접 push 금지)   # 모든 기능이 모여서 통합/테스트되는 브랜치
- `feature/*`: 기능 개발용   # 새로운 기능 추가 시 작업하는 브랜치
- `fix/*`: 버그 수정용       # 기존 기능에 문제가 생겼을 때 수정하는 브랜치
- `hotfix/*`: 긴급 수정용    # 배포 중 빠르게 고쳐야 할 버그 대응 브랜치

## 팀장 역할

- PR 리뷰 및 dev 머지         # 팀원이 올린 PR을 확인하고 dev에 병합
- main 릴리스 관리            # 배포 준비 → release 브랜치 생성 → main 병합 → 태그 → dev에 역머지

## 팀원 역할

1. 작업 시작 전

   git switch dev             # dev 브랜치로 이동
   git pull --ff-only         # 원격 dev의 최신 코드를 로컬 dev로 가져오기
   git switch -c feature/my-task   # dev에서 분기하여 새 작업 브랜치 생성


2. 작업 중 다른 PR이 dev에 머지되면

   git add -A                 # 현재 작업 중인 변경사항 모두 스테이징
   git stash -u               # 변경사항 임시 저장(안전하게 숨김)

   git switch dev             # dev 브랜치로 이동
   git pull --ff-only         # 원격 dev를 최신 상태로 동기화

   git switch feature/my-task # 다시 내 작업 브랜치로 복귀
   git rebase origin/dev      # dev의 최신 변경사항을 내 브랜치 위에 재배치 (merge도 가능)
   git stash pop              # 임시 저장했던 변경사항 복원
   

3. 작업 완료 후


   git push -u origin feature/my-task   # 작업 브랜치를 원격에 올림
   # GitHub에서 PR 생성 (base=dev)    # dev 브랜치로 병합 요청(PR) 생성
   

4. dev에 머지되면 브랜치 삭제

   git branch -d feature/my-task        # 로컬 브랜치 삭제
   git push origin --delete feature/my-task   # 원격 브랜치 삭제
   

