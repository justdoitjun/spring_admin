<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>

<script>
    let websocket = {
        id:null,    //관리자의 id
        stompClient:null,   //ws와의 connection 정보
        init:function(){
            this.id = $('#adm_id').text();      //관리자 id를 갖고 와
            $("#connect").click(function() {
                websocket.connect();        //connect버튼을 누르면 connect가 되고
            });
            $("#disconnect").click(function() {
                websocket.disconnect();
            });
            $("#sendall").click(function() {
                websocket.sendAll();
            });
            $("#sendme").click(function() {
                websocket.sendMe();
            });
            $("#sendto").click(function() {
                websocket.sendTo();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('http://127.0.0.1:8088/ws');    //웹소켓을 연결하는 접속정보
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {      //connect가 실행되고 페이지 하나가 ws와 연결
                websocket.setConnected(true);                   //접속을 하고나면 webSocket 연결정보가 true인 거고
                console.log('Connected: ' + frame);
                this.subscribe('/send', function(msg) {         //접속을 하고나면 바로 받을 준비를 하는 거야.
                    //subscribe라는 단어 자체가 받을 준비를 한다는 것.(서버가 데이터를 주면 자동으로 받을 준비를 할게)
                    //send라고 서버가 보내면 바로 받르 준비하고 받은 메세지에 아래처럼 덧붙여서 보낼게.
                    // send라고 날라온 것을 catch해서 뿌려준다.
                    $("#all").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
                this.subscribe('/send/'+sid, function(msg) {
                    //send하고 admin 포트로 보내면, 바로 메세지를 뿌리게싿.
                    $("#me").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1+ "</h4>");
                });
                this.subscribe('/send/to/'+sid, function(msg) {
                    //send라고 하고 상대방 타인 포트ㄹ 지정해주면, 메세지를 일단 받고
                    // 이 메세지에 아래처럼 덧붙여서 보낼게.
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        sendAll:function(){
            //일단 메세지를 이렇게 포장하자
            // 보내는 사람은 누구고, 내용은 이거야.
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $("#alltext").val()
            });
            // 메세지를 포장했으니, /receiveAll이라는 라우터로 보내서
            //MsgController에 있는 recieveAll로 보내서 메세지를 보낼게.
            this.stompClient.send("/receiveall", {}, msg);
        },
        sendTo:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'receiveid' : $('#target').val(),

                // msgController에서 받는 사람 ID를 정해줘서 보내주
                'content1' : $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg);
            //msgController(receiveto 컨트롤러로 보내자!!! 이 때 msg라는 JSON 택배상자에 누가 받을 건지 정해두었어)
        },
        sendMe:function(){
            //sendME는
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $('#metext').val()
            });
            this.stompClient.send("/receiveme", {}, msg);
            //recieveme를 통해서 보내라. 그러면 msgController(라우터)가 이걸 받는다.
        }
    };
    $(function(){
        websocket.init();
    })

</script>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Live Chart</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Live Chart</h6>
        </div>
        <div class="card-body">
            <div id="container"></div>
            <div class="col-sm-5">
                <h1 id="adm_id">${loginadm.id}</h1>
                <H1 id="status">Status</H1>
                <button id="connect">Connect</button>
                <button id="disconnect">Disconnect</button>

                <h3>All</h3>
                <input type="text" id="alltext"><button id="sendall">Send</button>
                <div id="all"></div>

                <h3>Me</h3>
                <input type="text" id="metext"><button id="sendme">Send</button>
                <div id="me"></div>

                <h3>To</h3>
                <input type="text" id="target">
                <input type="text" id="totext"><button id="sendto">Send</button>
                <div id="to"></div>

            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</div>