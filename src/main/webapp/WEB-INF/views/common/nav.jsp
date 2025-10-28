<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
			<!-- nav 시작 -->
			<nav id="nav" class="nav">
				<ul>
					<li>
						<a href="${path}/main.do">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M225.3 2492.374v6.247a4.691 4.691 0 0 1-4.689 4.684H218v-4.686a2.6 2.6 0 0 0-5.21 0v4.686h-2.6a4.692 4.692 0 0 1-4.689-4.684v-6.247a4.667 4.667 0 0 1 1.748-3.65l5.21-4.189a4.722 4.722 0 0 1 5.88 0l5.21 4.189a4.664 4.664 0 0 1 1.751 3.65z" transform="translate(-205.396 -2483.404)" />
							</svg>
							<span>홈</span>
						</a>
					</li>
					<li>
						<a href="${path}/drug_list.do">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M13.5361 15.3037L10.6748 18.1631C9.54326 19.2971 7.97959 20 6.25 20C2.79781 20 0 17.2022 0 13.75C2.63599e-05 12.0204 0.702974 10.4567 1.83691 9.3252L4.69629 6.46387L13.5361 15.3037ZM13.75 0C17.2022 0 20 2.79781 20 6.25C20 7.95156 19.3156 9.49263 18.2119 10.6191L18.2178 10.625L15.3037 13.5361L6.46387 4.69629L9.375 1.78223L9.38184 1.78809C10.5083 0.684593 12.0474 2.6072e-05 13.75 0Z" />
							</svg>
							<span>영양제</span>
						</a>
					</li>
					<li>
						<a href="${path}/qna/list">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M513.5 2780.447v10.526a.515.515 0 0 1-.326.485.461.461 0 0 1-.2.042.533.533 0 0 1-.379-.158l-1.905-1.948h-9.295a3.688 3.688 0 0 1-3.684-3.684h7.895a5.265 5.265 0 0 0 5.263-5.263v-3.527a3.692 3.692 0 0 1 2.631 3.527zm-4.211 0v-5.263a3.688 3.688 0 0 0-3.684-3.684h-8.421a3.688 3.688 0 0 0-3.684 3.684v10.526a.514.514 0 0 0 .326.484.458.458 0 0 0 .2.042.534.534 0 0 0 .379-.158l1.905-1.947h9.295a3.689 3.689 0 0 0 3.684-3.684z" transform="translate(-493.5 -2771.5)" />
							</svg>
							<span>Q&amp;A</span>
						</a>
					</li>
					<li>
						<c:if test="${sessionScope.sessionID != null}">
							<a href="${path}/myPage.do">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
									<path d="M690.153 2704.763a5.349 5.349 0 1 1 5.348 5.263 5.312 5.312 0 0 1-5.348-5.263zm11.73 6.391a10.678 10.678 0 0 0-3.765.229 5.475 5.475 0 0 1-5.234 0 10.768 10.768 0 0 0-3.765-.229 4.759 4.759 0 0 0-3.618 4.626v1.064a3.676 3.676 0 0 0 .527 1.9 1.606 1.606 0 0 0 1.374.755h16.2a1.6 1.6 0 0 0 1.374-.756 3.67 3.67 0 0 0 .527-1.9v-1.064a4.757 4.757 0 0 0-3.62-4.626z" transform="translate(-685.5 -2699.5)" />
								</svg>
								<span>마이</span>
							</a>
						</c:if>
						<c:if test="${sessionScope.sessionID == null}">
							<a href="${path}/login.do">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
									<path d="M690.153 2704.763a5.349 5.349 0 1 1 5.348 5.263 5.312 5.312 0 0 1-5.348-5.263zm11.73 6.391a10.678 10.678 0 0 0-3.765.229 5.475 5.475 0 0 1-5.234 0 10.768 10.768 0 0 0-3.765-.229 4.759 4.759 0 0 0-3.618 4.626v1.064a3.676 3.676 0 0 0 .527 1.9 1.606 1.606 0 0 0 1.374.755h16.2a1.6 1.6 0 0 0 1.374-.756 3.67 3.67 0 0 0 .527-1.9v-1.064a4.757 4.757 0 0 0-3.62-4.626z" transform="translate(-685.5 -2699.5)" />
								</svg>
								<span>마이</span>
							</a>
						</c:if>
					</li>
				</ul>

				<a id="btnTop" class="btn bdr-blue medium circle shadow" href="#content">
					<i class="ico top"><span>처음으로</span></i>
				</a>
				
				<button type="button" class="btn blue medium circle shadow"  id="cw-fab" onclick="cwOpen()">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#687FE5" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						<rect x="3" y="11" width="18" height="10" rx="2"/>
						<circle cx="12" cy="5" r="2"/>
						<path d="M12 7v4"/>
						<line x1="8" y1="16" x2="8" y2="16"/>
						<line x1="16" y1="16" x2="16" y2="16"/>
					</svg>
				</button>
			</nav>
			<!-- nav 끝 -->
