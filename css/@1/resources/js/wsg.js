// progress list
function progress(table,idx) {

	//project path
	var url = $(location).attr('pathname'),
		path = url.substring(0, url.lastIndexOf('/')),
		projectUrl = path.replace("/@1","");

	//tr numbering
	numbering(table);

	//td state
	var statePage = $(table).find("td.state"),
		total = statePage.length,
		sum = {
			com: 0,
			ing: 0,
			half: 0,
			except: 0,
			wait: 0
		};

	//statePage
	statePage.each(function(i, v) {
		var tdi = $(v),
			prop = {
				directory: tdi.siblings('.path').text(),
				pageId: tdi.siblings('.pageid').text()
			},
			tdA = $("<a>")
				.attr("target", "_blank")
				.attr("href", projectUrl +"/"+ prop.directory + "/" + prop.pageId + ".html")
				.text(v.textContent);

		//mobile size popup
		if($(this).hasClass('viewport')){
			var tdA = $("<a>")
				.attr("target", "_blank")
				.attr("href", projectUrl +"/"+ prop.directory + "/" + prop.pageId + ".html")
				.attr("onclick", "window.open(this.href,'targetWindow','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=375,height=667');return false;")
				.text(v.textContent);
		}

		//state
		if (tdi.text() == "진행") {
			tdi.addClass("working");
			sum.ing++;
		} else if (tdi.text() == "PC 완료") {
			tdi.addClass("complete half");
			sum.half++;
		} else if (tdi.text() == "MO 완료") {
			tdi.addClass("complete half");
			sum.half++;
		} else if (tdi.text() == "완료") {
			tdi.addClass("complete");
			sum.com++;
		} else if (tdi.text() == "검수완료") {
			tdi.addClass("complete checked");
			sum.com++;
		} else if (tdi.text() == "삭제") {
			tdi.addClass("del");
			sum.except++;
		} else if (tdi.text() == "제외") {
			tdi.addClass("del");
			sum.except++;
		} else if (tdi.text() == "보류") {
			tdi.addClass("wating");
			sum.wait++;
		} else {

		}
		tdi.html(tdA);

	});

	//section progress
	var tbSec = $(table).closest('.section'),
		secTitle = $(tbSec).find('.section-title'),
		real = {
			sum: total - sum.except,
			per: sum.com + (sum.half / 2)
		},
		percent = parseInt((real.per / real.sum) * 100),
		txt = '<div class="sec-progress pack-both">'+
				'<p class="page pack-left">'+
					'<strong>총 '+ total + '중</strong>'+
					'<span>완료 :'+ sum.com + '</span>'+
					'<span>일부완료 : '+ sum.half + '</span>'+
					'<span>진행 :'+ sum.ing + '</span>'+
					'<span>제외/삭제 :'+ sum.except + '</span>'+
					'<span>대기 :'+ sum.wait + '</span>'+
				'</p>'+
				'<p class="percent">'+ percent +'%</p>'+
				'</div>';
	$(secTitle).after(txt);

	//progress-bar
	var progressWrap = $("#progressSec"),
		section = {
			title: secTitle.text(),
		},
		secGrapth = '<div class="progress-wrap">'+
						'<h4 class="small-title">'+section.title + '</h4>'+
						'<div class="progress-bar">'+
							'<div class="progress-value" style="width:'+ percent +'%;">'+
								'<span>'+ percent + '%</span>'+
							'</div>'+
						'</div>'+
					'</div>';
	$(progressWrap).append(secGrapth);
}

// tbody > tr > th numbering
function numbering(table) {
	$(table).find("tbody tr th:first-child").each(function(i, v) {
		$(v).text(i + 1);
	});
}

//toggleContent
function toggleContent(b,t) {
	if($(b).hasClass('active')){
		$(b).removeClass("active");
		$(t).removeClass("active").slideUp(300);
	} else {
		$(b).addClass("active");
		$(t).addClass("active").slideDown(300);
	}
}

//navCurrent
function navCurrent(dep1) {
	var nav = $('#nav'),
		menu = $('#nav > ul > li'),
		current = $(menu).eq(dep1 - 1);

	if(!dep1 == ""){
		$(current).addClass('current');

		const myTimeout = setTimeout(currentSlide, 500);

		function currentSlide() {
			var navWid = $(nav).outerWidth(),
				posi = $(current).offset().left,
				wid = $(current).outerWidth(),
				posiR =  posi + wid;

			if(posiR > navWid){
				$("#nav").scrollLeft(posi);
			}
		}
	}
}

//headerFix
function headerFix() {
	//scroll
	var headerFix = $('#header').outerHeight();

	$(window).scroll(function(){
		if ($(window).scrollTop() >= headerFix) {
			$('#header').addClass("fixed");
		} else {
			$('#header').removeClass("fixed");
		}
	});
}

//numberMaxLength
function vh(){
	//for ios vh
	let vh = window.innerHeight * 0.01;
	document.documentElement.style.setProperty('--vh', `${vh}px`);
}

jQuery(function(){
	$(window).on("load", function () {
		vh();
	});
	$(window).on("resize", function () {
		vh();
	});
});
