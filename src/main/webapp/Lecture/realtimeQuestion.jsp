<%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2022-12-05
  Time: 오후 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>실시간 질문(학생)</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/peerjs@1.4.7/dist/peerjs.min.js"></script>
</head>
<style>
  video {
    width: 100%;
    height: 88%;
    background-color: black;
  }
  .groupChat::-webkit-scrollbar {
    width: 10px;
  }
  .groupChat::-webkit-scrollbar-thumb {
    background-color: #CED2DB;
    border-radius: 5px;
  }
  .groupChat::-webkit-scrollbar-track {
    border-radius: 5px;
  }
  li {
    border-radius: 10px;
    margin-bottom: 25px;
    padding: 10px;
  }
  #myMsg {
    text-align: right;
    background-color: #D0D3E3;
  }
  #yourMsg {
    background-color: white
  }
  #enterMsg {
    text-align: center;
  }
  #teacherMsg {
    background-color: #AACAC5
  }
</style>
<body>
<div class="row h-100 w-100 ml-0 mr-0">
    <div class="col-1 h-100 border pt-2">
        <button class="btn btn-success" type="button" onclick="goBack()">나가기</button>
        <script>
            function goBack() {
              history.back(-1);
            }
        </script>
    </div>
    <div class="col-8 h-100">
        <div class="pt-4 pb-1">
            <h5 style="font-weight: bold">${lecture.lectureTitle}</h5>
        </div>
        <hr>
        <video id="lectureVideo" autoplay playsinline></video>
    </div>
    <div class="col-3 h-100 border" style="background-color: #EDEFF4">
        <div class="pt-4 pb-1">
            <h5 style="font-weight: bold">Group Chat</h5>
        </div>
        <hr>
        <div class="groupChat" style="height: 82%; overflow: auto;">
            <ul id="chatBox" class="pl-0 pr-2" style="list-style: none">

            </ul>
        </div>
        <div class="pt-3">
            <input id="chatText" type="text" class="form-control"
                   placeholder="메시지를 입력해주세요">
        </div>
    </div>
</div>
</body>
<script>
  let peer = null;
  let conn = null;
  let video = null;
  let pArr = '${user.userId}'.split('@');
  let peerId = pArr[0] + pArr[1].substring(0, 1) + '${lecture.lectureNo}';
  let rArr = '${lecture.userId}'.split('@');
  let roomId = rArr[0] + rArr[1].substring(0, 1) + '${lecture.lectureNo}';
  
  function handleSuccess(stream, id) {
    const video = document.querySelector(id);
    window.stream = stream;
    video.srcObject = stream;
  }

  function autoScroll () {
    let gc = $('.groupChat');
    gc.scrollTop(gc[0].scrollHeight);
  }

  $(async function() {

    const constraints = window.constraints = {
      audio: false,
      video: {
        width: 1249,
        height: 824
      }
    };

    peer = new Peer(peerId, {
      host: '192.168.18.11',
      port: 9000,
      path: '/'
    });

    peer.on('open', async function(id) {
      console.log('My peer ID is: ' + id);
      conn = await peer.connect(roomId);
      conn.on('open', function() {
        conn.send({
          'stuId': peer.id,
          'stuName': '${user.userName}',
        });
      });
    });

    peer.on('call', async function(call) {
      await call.answer();
      call.on('stream', async function(stream) {
        handleSuccess(stream, '#lectureVideo');
      })
    })

    peer.on('connection', function(conn) {
      conn.on('open', function() {
        conn.on('data', function(data) {
          if(data.id === roomId) {
            let dispHtml = '<li id="teacherMsg">' + '<small><b>' + data.name + '</b> / ' + data.now
                + ' </small><br>' + data.msg + '<br>' + '</li>';
            $('#chatBox').append(dispHtml);
          } else if(data.id === undefined) {
            console.log(data);
            let dispHtml = '<li id="enterMsg">' + data + '</li>';
            $('#chatBox').append(dispHtml);
          } else if(data.id !== peer.id) {
            let dispHtml = '<li id="yourMsg">' + '<small><b>' + data.name + '</b> / ' + data.now
                + ' </small><br>' + data.msg + '<br>' + '</li>';
            $('#chatBox').append(dispHtml);
          }
          autoScroll();
        });
      })
    })
  })

  $('#chatText').keypress(async function(e) {
    let chatText = $('#chatText');

    if(e.keyCode === 13) {
      let date = new Date();
      let now = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':'
          + (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes());
      let msg = chatText.val();
      let dispHtml = '<li id="myMsg">' + '<small><b>' + '${user.userName}' + '</b> / ' + now + ' </small><br>' + msg + '<br>' + '</li>';
      $('#chatBox').append(dispHtml);
      autoScroll();
      chatText.val('');

      let data = {
        'name': '${user.userName}',
        'id': peer.id,
        'now': now,
        'msg': msg
      };

      conn = await peer.connect(roomId);
      conn.on('open', function() {
        conn.send(data);
      });
    }
  })

</script>
</html>
