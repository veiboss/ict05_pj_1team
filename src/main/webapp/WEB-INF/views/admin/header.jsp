<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YAKSOK ADMIN header</title>
</head>
<body>
		<!-- header 시각 -->
		<header id="header" class="header">
			<div>
				<button type="button" class="btn toggle-nav">
					<span class="material-symbols-outlined">
						arrow_circle_left
					</span>
				</button>
			</div><!-- #header > div : left-->

			<div>
				<div class="user">
					<c:if test="${sessionID != null and sessionGrade == 'ADMIN'}">
						<ul>
							<li>
								<button type="button" class="btn btn-toggle">
									<span class="fs-s mo-pack-down">${sessionID}<strong>${sessionName}</strong></span>
									<img src="https://img.imbc.com/adams/Program/20237/133342330004430266.jpg" alt="{user name}" class="img profile">
								</button>
								<div class="toggle-cont">
									<ul>
										<li>
											<a href="${path}/memberList.ad?s_grade=ADMIN" class="btn">
												<span class="material-symbols-outlined">
													account_circle
												</span>
												<span>계정 관리</span>
											</a>
										</li>
										<li>
											<a href="${path}/logout.ad" class="btn">
												<span class="material-symbols-outlined">logout</span>
												<span>로그아웃</span>
											</a>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</c:if>
					
					<c:if test="${sessionID == null}">
						<script type="text/javascript">
							alert("관리자 로그인 페이지로 이동합니다.");
							window.location = "${path}/login.ad";
						</script>
					</c:if>
				</div>
			</div><!-- #header > div : right-->
		</header>
		<!-- header 끝 -->
</body>
</html>