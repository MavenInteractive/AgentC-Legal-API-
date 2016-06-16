<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
    <div>
        <span>Dear {{$fullname}}, </span>
        <br />
        <p>
        We received a request for password retrieval for username {{ $username }} at AgentC Legal App.</p><br />
        <span>Your new password is</span><br />
        <strong>{{ $password }}</strong>
        <br /><br />
        <span>For any assistance, please email our customer support:  <a href="support@agent-c-legal.com"> support@agent-c-legal.com</a>.</span>
        <br /><br />
        <span>Best regards,</span><br /><br />
        <span>Team AgentC Legal</span>
    </div>
</body>
</html>
