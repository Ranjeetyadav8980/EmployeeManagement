<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room Report - Reax Hotel</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
*{ margin:0; padding:0; box-sizing:border-box; font-family:'Poppins',sans-serif; }
body{ min-height:100vh; background:url('https://images.unsplash.com/photo-1566073771259-6a8506099945'); background-size:cover; background-position:center; background-attachment:fixed; }
.overlay{ background:rgba(0,0,0,0.20); min-height:100vh; padding:30px; }
.logo{text-align:center; margin-bottom:20px;}
.logo img{ width:250px; }
.container{ width:95%; margin:auto; padding:25px; border-radius:20px; background:rgba(255,255,255,0.05); backdrop-filter:blur(12px); border:1px solid rgba(255,255,255,0.3); box-shadow:0 0 25px rgba(255,215,0,0.3); color:white; }
h2{text-align:center; color:gold; margin-bottom:20px;}
table{ width:100%; border-collapse:collapse; text-align:center;}
th{ background:rgba(255,215,0,0.8); color:black; padding:10px; font-size:14px; }
td{ padding:10px; border-bottom:1px solid rgba(255,255,255,0.2); font-size:13px; }
tr:hover{ background:rgba(255,255,255,0.1); }
.available{ color:lime; font-weight:bold; }
.occupied{ color:red; font-weight:bold; }
.maintenance{ color:orange; font-weight:bold; }

.btn{
    display:inline-block;
    padding:8px 14px;
    background:gold;
    color:black;
    text-decoration:none;
    border-radius:8px;
    font-size:13px;
    transition:0.3s;
}
.btn:hover{
    background:#ffcc00;
    transform:scale(1.05);
}

/* NEW ACTION BUTTON STYLING */
.action-buttons{
    display:flex;
    justify-content:center;
    gap:10px;            /* left-right spacing */
    flex-wrap:wrap;      /* allows up-down if needed */
}

.delete-btn{
    background:red;
    color:white;
}
.delete-btn:hover{
    background:darkred;
}

.footer{text-align:center; margin-top:20px; color:white; font-size:13px;}
</style>
</head>

<body>

<div class="overlay">

    <!-- LOGO -->
    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Reax Logo">
    </div>

    <div class="container">

        <h2>Room Management Report</h2>

        <c:choose>
            <c:when test="${!empty empl}">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Room No</th>
                        <th>Type</th>
                        <th>Bed</th>
                        <th>Floor</th>
                        <th>Price</th>
                        <th>Capacity</th>
                        <th>Status</th>
                        <th>Facilities</th>
                        <th>Action</th>
                    </tr>

                    <c:forEach var="r" items="${empl}">
                        <tr>
                            <td>${r.roomId}</td>
                            <td>${r.roomNumber}</td>
                            <td>${r.roomType}</td>
                            <td>${r.bedType}</td>
                            <td>${r.floorNumber}</td>
                            <td>Rs. ${r.pricePerNight}</td>
                            <td>${r.capacity}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${r.status=='Available'}">
                                        <span class="available">Available</span>
                                    </c:when>
                                    <c:when test="${r.status=='Occupied'}">
                                        <span class="occupied">Occupied</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="maintenance">Maintenance</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>
                                <c:if test="${r.wifiAvailable}">WiFi </c:if>
                                <c:if test="${r.acAvailable}">AC </c:if>
                                <c:if test="${r.tvAvailable}">TV </c:if>
                                <c:if test="${r.minibarAvailable}">Minibar</c:if>
                            </td>

                            <td>
                                <div class="action-buttons">

                                    <!-- UPDATE -->
                                    <a href="${pageContext.request.contextPath}/room_update?roomId=${r.roomId}" 
                                       class="btn">
                                       Update
                                    </a>

                                    <!-- DELETE -->
                                    <a href="${pageContext.request.contextPath}/room_delete?roomId=${r.roomId}" 
                                       class="btn delete-btn"
                                       onclick="return confirm('Are you sure you want to delete this room?');">
                                       Delete
                                    </a>

                                </div>
                            </td>

                        </tr>
                    </c:forEach>

                </table>
            </c:when>

            <c:otherwise>
                <h3 style="text-align:center;color:red;">No Room Data Available</h3>
            </c:otherwise>
        </c:choose>

        <br><br>
        <div style="text-align:center;">
            <a href="r" class="btn">+ Add New Room</a>
        </div>

    </div>

    <div class="footer">
        © 2026 Reax Hotel Management System
    </div>

</div>

</body>
</html>