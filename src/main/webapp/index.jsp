<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP 게시판 메인</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Style -->
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #6db3f2, #1e69de);
            font-family: "Segoe UI", sans-serif;
            overflow: hidden;
        }

        /* Glassmorphism 효과 */
        .glass-card {
            width: 520px;
            padding: 40px 30px;
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.25);
            text-align: center;
            color: #fff;
            animation: floatUp 0.8s ease-out;
        }

        h1 {
            font-size: 38px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .sub {
            font-size: 16px;
            opacity: 0.85;
            margin-bottom: 30px;
        }

        .icon {
            font-size: 60px;
            margin-bottom: 20px;
            animation: popIn 1s ease-out;
        }

        .btn-custom {
            padding: 14px;
            font-size: 18px;
            font-weight: 600;
            border-radius: 10px;
        }

        @keyframes floatUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes popIn {
            0% {
                transform: scale(0.6);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
    </style>
</head>

<body>

<div class="glass-card">
    <div class="icon">🌐</div>
    <h1>JSP 게시판</h1>
    <p class="sub">Web Service Development · JSP · Bootstrap</p>

    <a href="list.jsp" class="btn btn-light btn-custom w-100 mt-3">
        게시판 목록 보기 →
    </a>
</div>

</body>
</html>
