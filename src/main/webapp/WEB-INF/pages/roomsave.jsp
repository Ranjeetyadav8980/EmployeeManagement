<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reax Hotel Management System</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:url('https://images.unsplash.com/photo-1566073771259-6a8506099945');
    background-size:cover;
    background-position:center;
    background-attachment:fixed;
}

.overlay{
    background:rgba(0,0,0,0.15);
    min-height:100vh;
    padding:30px 0;
}

.logo{
    text-align:center;
}

.logo img{
    width:220px;
}

.nav{
    text-align:center;
    margin:15px 0;
}

.nav a{
    text-decoration:none;
    background:gold;
    padding:7px 18px;
    border-radius:8px;
    color:black;
    font-size:13px;
    font-weight:bold;
    margin:0 5px;
}

.card{
    width:650px;
    margin:auto;
    padding:25px;
    border-radius:20px;
    background:rgba(255,255,255,0.03);
    backdrop-filter:blur(10px);
    border:1px solid rgba(255,255,255,0.3);
    color:white;
}

h2{
    text-align:center;
    color:gold;
    margin-bottom:20px;
}

select{
    width:100%;
    padding:8px;
    margin-bottom:12px;
    border-radius:8px;
    border:1px solid rgba(255,255,255,0.6);
    background:transparent;
    color:white;
}

select option{
    background:black;
    color:white;
}

.checkbox-group{
    display:flex;
    justify-content:space-between;
    font-size:13px;
    margin-bottom:12px;
}

button{
    width:100%;
    padding:9px;
    border:none;
    border-radius:8px;
    background:gold;
    font-weight:bold;
}

.footer{
    text-align:center;
    margin-top:15px;
    color:white;
    font-size:12px;
}
</style>
</head>

<body>
<div class="overlay">

    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.png">
    </div>

    <div class="nav">
        <a href="${pageContext.request.contextPath}/display">View All Rooms</a>
    </div>

    <div class="card">
        <h2>Room Registration Panel</h2>

        <frm:form action="save" method="post" modelAttribute="room">

            <frm:select path="roomNumber">
                <frm:option value="" label="Select Room Number"/>
                <frm:option value="101"/>
                <frm:option value="102"/>
                <frm:option value="103"/>
                <frm:option value="201"/>
                <frm:option value="202"/>
            </frm:select>

            <frm:select path="roomType">
                <frm:option value="Single"/>
                <frm:option value="Deluxe"/>
                <frm:option value="Suite"/>
            </frm:select>

            <frm:select path="bedType">
                <frm:option value="King"/>
                <frm:option value="Queen"/>
                <frm:option value="Twin"/>
            </frm:select>

            <frm:select path="floorNumber">
                <frm:option value="1"/>
                <frm:option value="2"/>
                <frm:option value="3"/>
                <frm:option value="4"/>
            </frm:select>

            <frm:select path="pricePerNight">
                <frm:option value="2000"/>
                <frm:option value="3000"/>
                <frm:option value="5000"/>
                <frm:option value="8000"/>
            </frm:select>

            <frm:select path="capacity">
                <frm:option value="1"/>
                <frm:option value="2"/>
                <frm:option value="3"/>
                <frm:option value="4"/>
            </frm:select>

            <frm:select path="status">
                <frm:option value="Available"/>
                <frm:option value="Occupied"/>
                <frm:option value="Maintenance"/>
            </frm:select>

            <div class="checkbox-group">
                <label><frm:checkbox path="wifiAvailable"/> WiFi</label>
                <label><frm:checkbox path="acAvailable"/> AC</label>
                <label><frm:checkbox path="tvAvailable"/> TV</label>
                <label><frm:checkbox path="minibarAvailable"/> Minibar</label>
            </div>

            <frm:select path="description">
                <frm:option value="Sea View Room"/>
                <frm:option value="City View Room"/>
                <frm:option value="Luxury Suite"/>
                <frm:option value="Pool Side Room"/>
            </frm:select>

            <button type="submit">Save Room</button>

        </frm:form>
    </div>

    <div class="footer">
        © 2026 Reax Hotel Management System
    </div>

</div>
</body>
</html>
