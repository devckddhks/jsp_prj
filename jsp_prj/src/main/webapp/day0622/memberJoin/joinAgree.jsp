<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 약관동의 | BallPick</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/kr.user.member/member.css">
</head>
<body>

<main class="member-page">
    <section class="member-shell">
        <h1 class="member-title">회원가입</h1>
        <div class="member-steps" aria-label="회원가입 단계">
            <div class="member-step active"><span class="member-step-number">1</span>약관동의</div>
            <div class="member-step"><span class="member-step-number">2</span>정보입력</div>
            <div class="member-step"><span class="member-step-number">3</span>가입완료</div>
        </div>

        <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="member-error"><%=request.getAttribute("errorMessage")%></div>
        <% } %>

        <form id="agreementForm" method="post"
              action="<%=request.getContextPath()%>/member/join-form.do">
            <h2 class="member-section-title">이용약관 동의</h2>

            <div class="member-agreement">
                <div class="member-agreement-head">
                    <label class="member-check-label">
                        <input type="checkbox" id="agreeAll">
                        <strong>전체 동의</strong>
                    </label>
                </div>
            </div>

            <div class="member-agreement">
                <div class="member-agreement-head">
                    <label class="member-check-label">
                        <input type="checkbox" class="agreement-check required-agreement"
                               id="termsAgree" name="termsAgree" value="Y">
                        볼픽 이용약관 동의 <span class="member-required">(필수)</span>
                    </label>
                    <button class="member-agreement-toggle" type="button" data-target="termsContent">내용보기</button>
                </div>
                <div class="member-agreement-content" id="termsContent">
                    볼픽은 야구 경기 정보와 예매 서비스를 제공합니다. 회원은 서비스 이용 시 정확한 정보를 입력해야 하며,
                    다른 회원의 서비스 이용을 방해하거나 부정한 방법으로 서비스를 이용해서는 안 됩니다.
                </div>
            </div>

            <div class="member-agreement">
                <div class="member-agreement-head">
                    <label class="member-check-label">
                        <input type="checkbox" class="agreement-check required-agreement"
                               id="privacyAgree" name="privacyAgree" value="Y">
                        개인정보 수집 및 이용 동의 <span class="member-required">(필수)</span>
                    </label>
                    <button class="member-agreement-toggle" type="button" data-target="privacyContent">내용보기</button>
                </div>
                <div class="member-agreement-content" id="privacyContent">
                    수집 항목은 회원코드, 이름, 이메일, 휴대폰번호, 주소입니다. 수집한 정보는 회원 식별, 예매 서비스 제공,
                    고객 문의 응대 목적으로 이용하며 관련 법령 및 내부 정책에 따라 보관합니다.
                </div>
            </div>

            <div class="member-agreement">
                <div class="member-agreement-head">
                    <label class="member-check-label">
                        <input type="checkbox" class="agreement-check"
                               id="smsReceiveYN" name="smsReceiveYN" value="Y">
                        SMS 혜택정보 수신 동의 (선택)
                    </label>
                </div>
            </div>

            <div class="member-agreement">
                <div class="member-agreement-head">
                    <label class="member-check-label">
                        <input type="checkbox" class="agreement-check"
                               id="emailReceiveYN" name="emailReceiveYN" value="Y">
                        이메일 혜택정보 수신 동의 (선택)
                    </label>
                </div>
            </div>

            <div id="clientError" class="member-error" hidden></div>
            <div class="member-actions">
                <a class="member-button member-button-light" href="<%=request.getContextPath()%>/main.do">취소</a>
                <button class="member-button" type="submit">다음</button>
            </div>
        </form>
    </section>
</main>

<script>
const agreementChecks = Array.from(document.querySelectorAll(".agreement-check"));
const agreeAll = document.getElementById("agreeAll");

agreeAll.addEventListener("change", function() {
    agreementChecks.forEach(function(check) {
        check.checked = agreeAll.checked;
    });
});

agreementChecks.forEach(function(check) {
    check.addEventListener("change", function() {
        agreeAll.checked = agreementChecks.every(function(item) { return item.checked; });
    });
});

document.querySelectorAll(".member-agreement-toggle").forEach(function(button) {
    button.addEventListener("click", function() {
        const content = document.getElementById(button.dataset.target);
        content.classList.toggle("open");
        button.textContent = content.classList.contains("open") ? "닫기" : "내용보기";
    });
});

document.getElementById("agreementForm").addEventListener("submit", function(event) {
    const requiredChecked = Array.from(document.querySelectorAll(".required-agreement"))
        .every(function(check) { return check.checked; });
    if (!requiredChecked) {
        event.preventDefault();
        const error = document.getElementById("clientError");
        error.textContent = "필수 약관에 모두 동의해 주세요.";
        error.hidden = false;
    }
});
</script>
</body>
</html>

