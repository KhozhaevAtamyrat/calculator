<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>
        <%@include file="style.css"%>
    </style>
    <script type="text/javascript">
        function check(num) {
            const outputResult = document.getElementById("result");
            if (!Number.isInteger(num)) {
                let str = outputResult.value;
                if (str.includes("+") || str.includes("-") || str.includes("*") || str.includes("/")) {
                    outputResult.value += ' ' + num + ' ';
                    let equalsBtn = document.getElementById("equals");
                    equalsBtn.click();
                }
                outputResult.value += ' ' + num + ' ';
            } else
                outputResult.value += num;
        }
    </script>
</head>
<body class="content">
<div class="main-div">
    <form method="post" name="form" action="${pageContext.request.contextPath}/calculator">
        <div class="first-row">
            <input type="button" onclick="document.getElementById('result').value =''" id="clear"
                   class="btn btn-primary btn-clear" value="C"/>
            <input id="result" name="result" class="field" readonly value="${result}">
        </div>
        <div>
            <div>
                <input id="seven" type="button" class="btn btn-light" onclick="check(7)" value="7"/>
                <input id="eight" type="button" class="btn btn-light" onclick="check(8)" value="8"/>
                <input id="nine" type="button" class="btn btn-light" onclick="check(9)" value="9"/>
                <input id="divide" type="button" class="btn btn-light" onclick="check('/')" value="/"/>
            </div>
            <div>
                <input id="four" type="button" class="btn btn-light" onclick="check(4)" value="4"/>
                <input id="five" type="button" class="btn btn-light" onclick="check(5)" value="5"/>
                <input id="six" type="button" class="btn btn-light" onclick="check(6)" value="6"/>
                <input id="multiply" type="button" class="btn btn-light" onclick="check('*')" value="*"/>
            </div>
            <div>
                <input id="one" type="button" class="btn btn-light" onclick="check(1)" value="1"/>
                <input id="two" type="button" class="btn btn-light" onclick="check(2)" value="2"/>
                <input id="three" type="button" class="btn btn-light" onclick="check(3)" value="3"/>
                <input id="minus" type="button" class="btn btn-light" onclick="check('-')" value="-"/>
            </div>
            <div>
                <input id="dot" type="button" class="btn btn-light" onclick="check('.')" value="."/>
                <input id="zero" type="button" class="btn btn-light" onclick="check(0)" value="0"/>
                <input id="equals" class="btn btn-light" type="submit" value="="/>
                <input id="plus" type="button" class="btn btn-light" onclick="check('+')" value="+"/>
            </div>
        </div>
    </form>
</div>
</body>
</html>
