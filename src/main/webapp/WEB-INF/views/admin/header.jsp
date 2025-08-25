<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<ul>
						<li>
							<button type="button" class="btn btn-toggle">
								<img src="https://img.imbc.com/adams/Program/20237/133342330004430266.jpg" alt="{user name}" class="img profile">
							</button>
							<div class="toggle-cont">
								<ul>
									<li>
										<div class="item pack-left">
											<img src="https://img.imbc.com/adams/Program/20237/133342330004430266.jpg" alt="{user name}" class="img profile">
											<div>
												<p>Hong Gil Dong</p>
												<p class="fs-s">admin</p>
											</div>
										</div>
									</li>
									<li>
										<a href="javascript:void(0);" class="btn">
											<span class="material-symbols-outlined">
												account_circle
											</span>
											<span>계정 관리</span>
										</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="btn">
											<span class="material-symbols-outlined">
											logout
											</span>
											<span>로그아웃</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div><!-- #header > div : right-->
		</header>
		<!-- header 끝 -->
</body>
</html>