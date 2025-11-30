# JSP CRUD 게시판 프로젝트

JSP(Java Server Pages)와 MariaDB를 활용하여 구축한 웹 게시판 서비스입니다.
기본적인 CRUD(생성, 조회, 수정, 삭제) 기능에 **파일 업로드, 검색, 정렬, 조회수 증가** 등의 부가 기능을 추가하여 실무와 유사한 형태의 게시판을 구현하였습니다.

## 사용 기술 (Tech Stack)

* **Language**: Java 17 (JDK 1.8 호환)
* **Web Technology**: JSP, Servlet
* **Database**: MariaDB
* **Frontend**: HTML5, CSS3, Bootstrap 5
* **Library**:
    * `cos.jar` (파일 업로드)
    * `jstl` (JSP 표준 태그 라이브러리)
    * `mariadb-java-client` (DB 연동)
* **Build Tool**: Maven

## 주요 기능 (Key Features)

### 1\. 게시글 CRUD (기본 기능)

* **Create**: 제목, 작성자, 이메일, 비밀번호, 카테고리, 내용을 입력하여 게시글을 작성합니다.
* **Read**: 게시글 목록과 상세 내용을 조회합니다.
* **Update**: 비밀번호 확인 후 게시글을 수정합니다.
* **Delete**: 비밀번호 확인 대신 삭제 확인 메시지(Confirm)를 통해 게시글을 삭제합니다.

### 2\. 파일 업로드 (메인 확장 기능)

* `MultipartRequest`를 사용하여 이미지 파일을 서버에 업로드합니다.
* 게시글 작성 및 수정 시 이미지를 첨부할 수 있습니다.
* **수정 로직**: 게시글 수정 시 새 파일을 업로드하면 기존 파일이 교체되고, 업로드하지 않으면 기존 파일이 유지됩니다.
* **이미지 출력**: 상세 보기(`view.jsp`)에서 업로드된 이미지를 확인할 수 있습니다.

### 3\. 부가 기능 3종

1.  **검색 기능**: 제목 또는 작성자 키워드로 게시글을 검색할 수 있습니다.
2.  **정렬 기능 (필터)**: 드롭다운 메뉴를 통해 목록을 정렬합니다.
    * 최신순 (`regdate desc`)
    * 오래된순 (`regdate asc`)
    * 조회수순 (`cnt desc`)
3.  **조회수 증가**: 게시글 상세 보기 클릭 시 조회수가 자동으로 1 증가합니다.

## 🗄️ 데이터베이스 스키마 (Database Schema)

프로젝트 실행을 위한 MariaDB 테이블 생성 SQL입니다.

```sql
CREATE TABLE BOARD (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    password VARCHAR(50),
    category VARCHAR(20),
    content TEXT,
    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cnt INT DEFAULT 0,
    filename VARCHAR(200)
);
```

## 실행 화면
![게시판 목록](/img/list.png)
![게시판 상세보기](/img/view.png)

## 프로젝트 구조 (Directory Structure)

```text
src
├── main
│   ├── java
│   │   └── org.example.project23.board
│   │       ├── BoardDAO.java      // DB 데이터 처리 (CRUD, 정렬, 검색 SQL)
│   │       ├── BoardVO.java       // 데이터 객체 (파일명 필드 포함)
│   │       └── JDBCUtil.java      // DB 연결 유틸리티
│   └── webapp
│       ├── list.jsp               // 게시글 목록 (검색, 정렬 UI)
│       ├── view.jsp               // 상세 보기 (이미지 출력, 조회수 증가)
│       ├── write.jsp / write_ok.jsp // 글 작성 및 파일 업로드 처리
│       ├── edit.jsp / edit_ok.jsp   // 글 수정 및 파일 교체 처리
│       ├── delete_ok.jsp          // 글 삭제 처리
│       ├── header.jsp / footer.jsp // 공통 레이아웃
│       ├── upload/                // 업로드된 파일이 저장되는 폴더
│       └── ...
```


### 개발자
* **Name**: Hayoung Kang
* **Student ID**: 22400011
* **Course**: Web Service Development