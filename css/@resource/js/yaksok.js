function detection() {
	var agent = navigator.userAgent.toLowerCase();

	if (agent.indexOf("android") != -1) {
		//안드로이드 일떄

	} else {
		var filter = "win16|win32|win64|mac|macintel";

		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
			//안드로이드가 아니면서 모바일일때
			$('.input-text, textarea').bind('focus',function() {
				$('body').addClass('opened-keyboard');
			});
			$('.input-text, textarea').bind('blur', function() {
				$('body').removeClass('opened-keyboard');
			});
		}else{
			//웹일 때


		}
	}
}
$(function(){

	//viewport
	detection();
	getViewports();
	nav.init();
	nav.resize();

	$(window).on("resize", function () {
		setTimeout(function () {
			detection()
		}, 50);
		getViewports();
		nav.init();
		nav.resize();
	});

	$(window).on("scroll", function () {
		nav.resize();
	});

	$(document).mouseup(function(e) {
		if($('.overlay:not(.not-close)').hasClass('active') == true){
			if(!$('.overlay').has(e.target).length) {
				$('.overlay').removeClass('active');
				$('body').removeClass('modal-opened')
			}
		}
	});

	//TAB
	tabLink();

	//AOS
	AOS.init({
		// Global settings:
		disable: false,
		offset: 0,
		duration: 750,
	});

	//pc typing
	/*setTimeout(function() {
		var $pctypeing= document.querySelector('#pcTyping');
		$pctypeing.addEventListener('th.beforeType', function (e) {
			$('#pcTyping2').addClass('blind');
		});
		$pctypeing.addEventListener('th.endType', function (e) {
			$('#pcTyping2').removeClass('blind');
			TypeHangul.type('#pcTyping2', {
				intervalType: 50,
				humanize: 0.5,
			});
		});
		TypeHangul.type('#pcTyping', {
			intervalType: 50,
			humanize: 0.5,
		});
	}, 200);*/
});

//nav
var nav = {
	gnbScrollTop: 0,
	delta: 80,
	wWidth: $(window).width(),
	//init
	init: function (wUrl) {
		//back
		$('#header .detail-line .btn').on("click", function () {
			if($('#content').hasClass('pick-step') != true){
				historyBack();
			}
		});

		//writeBtn
		var wBtn = $('#btnWrite');
		if(!wUrl){
			$(wBtn).hide();
		}else{
			$(wBtn).attr("href", wUrl);
		}
	},

	//resize
	resize: function () {
		$(window).on("scroll", function(e) {
			var st = $(this).scrollTop(),
				endingP = $(document).height() - $(window).height();

			//headerfix
			if (st > 0) {
				$('#header').addClass('fixed');
			} else{
				$('#header').removeClass('fixed');
			}

			//scrollCheck
			if (st == 0) {
				$('body').addClass('scroll-zero').removeClass('scroll-has');
			} else {
				$('body').addClass('scroll-has').removeClass('scroll-zero');

				//scroll Ending Check
				if (Math.round( st ) == endingP) {
					$('body').addClass('scroll-end');
				} else{
					$('body').removeClass('scroll-end');
				}

				//bg-fixed
				var bgArea = $('#content > .bg-fixed');
				if (bgArea.length) {
					var bgHeight = $(bgArea).outerHeight() + 100;
					if (st > bgHeight) {
						$(bgArea).addClass('scrolled');
					} else{
						$(bgArea).removeClass('scrolled');
					}
				}
			}

			if (Math.abs(nav.gnbScrollTop - st) <= nav.delta) return;

			//scroll up/down
			if ((st > nav.gnbScrollTop) && (nav.gnbScrollTop > 0)) {
				$('body').addClass('scroll-down').removeClass('scroll-up');
			} else {
				$('body').addClass('scroll-up').removeClass('scroll-down');
			}
			nav.gnbScrollTop = st;
		});
	},

	//current
	current: function (dep1) {
		var dep1eq = dep1 - 1,
			nav = $('#nav > ul > li');

		if (!dep1 == "") {
			$(nav).eq(dep1eq).find('a').addClass('current');
		}
	}
}

//tabLink
function tabLink() {
	$('.tabs > li a').each(function(){
		var tabContainer = $(this).closest('.tabs'),
			tabTarget = $(this).attr('href'),
			linkTarget = $(this).attr('title');

		$(this).click(function(e){
			var tabLocation = $(this).offset().top,
				tabHeight = $(this).parents('.tabs').outerHeight(),
				headerHeight = $('#header').outerHeight(),
				movePosi = tabLocation - tabHeight;

			if (linkTarget != '페이지이동'){
				e.preventDefault();
			}

			$(this).parent('li').addClass('current');
			$(this).parent('li').siblings('li').removeClass('current');
			$(tabTarget).addClass('active').siblings('.tab-content').removeClass('active');

			//탭이 스티키 탭이 아닐 때
			if($(tabContainer).hasClass('sticky-tab') == false){
				if (movePosi > headerHeight){
					movePosi = movePosi - headerHeight;
				}
			} else {
				tabGab = $('#header').outerHeight() - 20;
				movePosi = $(tabTarget).offset().top - tabGab;
			}

			window.scrollTo({top: movePosi, behavior:'smooth'});
		});
	});
}

//tabCurrent
function tabCurrent(t) {
	var ctab = $('a[href="'+t+'"]');
	$(ctab).trigger("click");
}

// modalOpen
function modalOpen(popId){
	$(popId).addClass('active');
	$('body').addClass('modal-opened');
}
// modalClose
function modalClose(popId){
	$(popId).removeClass('active');
	$('body').removeClass('modal-opened');
}

//getViewports
function getViewports() {
	var wWidth = $(window).width(),
		windowHeight = $(window).height();

	if(wWidth > 500) {
		$('body').removeClass('is-mobile');
	} else {
		$('body').addClass('is-mobile');
	}

	//for vh
	let vh = window.innerHeight * 0.01;
	document.documentElement.style.setProperty('--vh', `${vh}px`);
}

//togglePass
function togglePass(e) {
	var input = $(e).siblings('.input-text'),
		icon = $(e).children('.ico');

	if (input.attr('type') == 'password') {
		input.attr('type', 'text');
		$(icon).removeClass('no-show').addClass('show');
	} else {
		input.attr('type', 'password');
		$(icon).removeClass('show').addClass('no-show');
	}
}

//popFilter
function popFilter() {
	$('#popFilter .checkbox.all').change(function() {
		var checked = $(this).is(':checked'),
			othTarget = $(this).parent('.check-wrap').siblings('.check-wrap').find('.checkbox');
		if (checked) {
			$(othTarget).each(function() {
				$(this).prop('checked', true);
			});
		} else {
			$(othTarget).each(function() {
				$(this).prop('checked', false);
			});
		}
	});

	$('#popFilter .checkbox:not(.all)').click(function() {
		var myName = $(this).attr('name'),
			sameName = $('[name="+myName+"]'),
			allCheck = $(sameName).parent('.check-wrap').siblings('.check-wrap').find('.checkbox.all'),
			otherLeng = $(sameName).length - 1
			checkLeng = $('[name="+myName+"]:checked:not(.all)').length;
		if (otherLeng == checkLeng) {
			$(allCheck).prop('checked', true);
		} else {
			$(allCheck).prop('checked', false);
		}
	});
}

//back
function historyBack() {
	history.back();
}

//changeIcon
function changeIcon(e) {
	var icon = $(e).children('.ico');

	if($(icon).hasClass('heart') == true){
		if($(icon).hasClass('active') == true){
			$(icon).removeClass('active');
		} else{
			$(icon).addClass('likeit').addClass('active');
		}
		setTimeout(function() {
			$(icon).removeClass('likeit');
		}, 1000);
	}

	if($(icon).hasClass('bookmark') == true){
		if($(icon).hasClass('active') == true){
			$(icon).removeClass('active');
		} else{
			$(icon).addClass('likeit').addClass('active');
		}
		setTimeout(function() {
			$(icon).removeClass('likeit');
		}, 1000);
	}
}

//toggleReply
function toggleReply(btn) {
	var myRe = $(btn).closest('.comment-set').siblings('.reply-wrap'),
		count = parseInt($(btn).children('.count').text());

	if (count >= 1) {
		$(myRe).toggleClass('active');
	}
}

//showReplyForm
function showReplyForm(btn) {
	var myForm = $(btn).closest('.comment-set').find('.comment-form.reply'),
		myInput = $(myForm).find('textarea'),
		otherForm = $(btn).closest('li').siblings('li').find('.comment-form.reply'),
		otherTxt = $(btn).closest('li').siblings('li').find('.btn.show-form');

	$(btn).addClass('fc-000');
	$(myForm).removeClass('hidden');
	$(otherForm).addClass('hidden');
	$(otherTxt).removeClass('fc-000');
	$(myInput).focus();
}

//fileAdd
function fileAdd() {
	//File upload
	$('.js-add-file').on('change',function(event){
		var files = event.target.files;
		//type
		if ($(this).hasClass('input-text')){
			var type = 'input',
				myCon = $(this).closest('.field').find('.file-list');
		} else {
			var type = 'box',
				myCon = $(this).closest('.upload-btn');
		}

		var maxFileCnt = 5;		// 첨부파일 최대 개수
		var attFileCnt = $(myCon).siblings('.upload-file').length;	// 기존 첨부파일 개수
		var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
		var curFileCnt = files.length;  // 현재 선택된 첨부파일 개수

		//console.log('max: '+attFileCnt + '/ 기존 : '+ attFileCnt + '/ 가능 : '+ remainFileCnt + '/ 현재 : '+ curFileCnt);

		for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
			const file = files[i];

			var reader = new FileReader();
			reader.onload = function(e) {

				var html = "<div class='upload-file'><span class='file-name'>" + file.name + "</span><button type='button' class='btn file-remove' onclick='fileRemove(this);' data-id='" + file.name + "' ><i class='ico delete-black op38'><span>삭제</span></i></button></div>";

				if (type == 'box'){
					if(file.type.match("image/.*")){
						var html = "<div class='upload-file img'><div class='img-wrap r4'><img src='" + e.target.result + "' class='file-preview centered'></div><button type='button' class='btn file-remove' onclick='fileRemove(this);' data-id='" + file.name + "' ><i class='ico delete-black'><span>삭제</span></i></button></div>";
					};

					if(file.type.match("video/.*")){
						var html = "<div class='upload-file img'><div class='img-wrap r4'><img src='" + e.target.result + "' class='file-preview centered'></div><button type='button' class='btn file-remove' onclick='fileRemove(this);' data-id='" + file.name + "' ><i class='ico delete-black'><span>삭제</span></i></button></div>";
					};

					$(html).insertBefore(myCon);

					var upCount = $(myCon).siblings('.upload-file').length,
						countIn = $(myCon).find('.file-count');

					$(countIn).text( upCount );

					var fileInput = $(myCon).find('input');
					if( upCount >= maxFileCnt){
						$(fileInput).attr('disabled', true);
					}

				} else {
					$(html).prependTo(myCon);
				}

			}
			reader.readAsDataURL(file);
		}
	});
}

//File remove
function fileRemove(t) {
	$([''])
	var me = $(t).parent('.upload-file'),
		myCon = $(me).closest('.upload-wrap');
	$(me).remove();

	//type
	if ($(me).hasClass('img')){
		var upCount = $(myCon).children('.upload-file').length,
			countIn = $(myCon).find('.file-count');
		$(countIn).text( upCount );

		var fileInput = $(myCon).find('input');
		var maxFileCnt = 5;		// 첨부파일 최대 개수
		if( upCount >= maxFileCnt){
			$(fileInput).attr('disabled', true);
		} else{
			$(fileInput).removeAttr('disabled');
		}
	}
}

//sticker Remove
function stickerRemove(t) {
	var me = $(t),
		img = $(t).siblings('img');
	$(me).remove();
	$(img).remove();
}

//accordion
function accordion(targetN) {

	$('.accordion-switche').each(function(){
		var container = $(this).parents('.accordion');
		var slideContent = $(container).children('.accordion-content');

		if ($(container).hasClass('active')){
			$(container).addClass('active');
		}
	});

	$('.accordion-switche').click(function(e) {
		e.preventDefault();

		var container = $(this).parents('.accordion');
		var slideContent = $(container).children('.accordion-content');

		if ($(container).hasClass('active')){
			accordionClose();
		} else {
			if(targetN == 1){
				siblingsClose();
			}
			accordionOpen();
		}
		function accordionOpen() {
			$(container).addClass('active');
		}

		function accordionClose() {
			$(container).removeClass('active');
		}

		function siblingsClose() {
			$(container).siblings().removeClass('active');
		}
	});
}

//selectPlaceholder
function selectPlaceholder(elem) {
	if ($(elem).val() !== ""){
		$(this).removeClass('is-empty');
	} else {
		$(this).addClass('is-empty');
	}
}

//공백 제거
function noSpaceForm(obj) {
	var str_space = /\s/;	// 공백
	if(str_space.exec(obj.value)) {		//공백 체크
		alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
		obj.focus();
		obj.value = obj.value.replace(' ','');	// 공백제거
		return false;
	}
}

//numberMaxLength
function numberMaxLength(e){
	if(e.value.length > e.maxLength){
		e.value = e.value.slice(0, e.maxLength);
	}
}

// loadingActive
function loadingActive(){
	$('.loading').addClass('active');
	$('body').addClass('modal-opened');
}

// loadingInActive
function loadingInActive(){
	$('.loading').removeClass('active');
	$('body').removeClass('modal-opened');
}

// insertSticker
function insertSticker(el){
	var cloneTxt = $(el).children('img').clone(true);
	var btnDel = "<button type='button' class='btn file-remove' onclick='stickerRemove(this);'><i class='ico delete'><span>삭제</span></i></button>";

	$(".comment-form .for-sticker").html(cloneTxt);
	$(".comment-form .for-sticker").append(btnDel);
}



//confetti
function confetti() {
	setTimeout(() => {
		jsConfetti.addConfetti({
			confettiRadius: 6,
			confettiNumber: 160,
			/* 이모지콘으로도 할수 있어욤
			이모지 유니코드 : https://zigzagworld.tistory.com/684
			emojis: ['😻'],
			emojis: ['😍', '😉', '😘', '😻', '😊'],
			emojiSize: 20,
			*/
			confettiColors: [
				'#F94892', '#FF7F3F', '#FBDF07', '#89CFFD',
			],
		})
	}, 500)
}
