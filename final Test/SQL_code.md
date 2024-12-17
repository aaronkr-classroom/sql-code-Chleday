-- 교수 테이블
CREATE TABLE 교수 (
    교번 INT PRIMARY KEY,
    교수명 VARCHAR(50) NOT NULL
);

-- 강의실 테이블
CREATE TABLE 강의실 (
    강의실번호 INT PRIMARY KEY,
    좌석수 INT
);

-- 교과목 테이블
CREATE TABLE 교과목 (
    과목번호 INT PRIMARY KEY,
    과목명 VARCHAR(100) NOT NULL
);

-- 학생 테이블
CREATE TABLE 학생 (
    학번 INT PRIMARY KEY,
    학생명 VARCHAR(50) NOT NULL
);

-- 강의 테이블 (교수와 강의실을 참조)
CREATE TABLE 강의 (
    강의번호 INT PRIMARY KEY,
    교번 INT,
    강의실번호 INT,
    FOREIGN KEY (교번) REFERENCES 교수(교번),
    FOREIGN KEY (강의실번호) REFERENCES 강의실(강의실번호)
);

-- 수강신청 테이블 (학생과 교과목을 참조)
CREATE TABLE 수강신청 (
    학번 INT,
    과목번호 INT,
    신청날짜 DATE,
    PRIMARY KEY (학번, 과목번호),
    FOREIGN KEY (학번) REFERENCES 학생(학번),
    FOREIGN KEY (과목번호) REFERENCES 교과목(과목번호)
);

-- 수강취소 테이블 (학생과 교과목을 참조)
CREATE TABLE 수강취소 (
    학번 INT,
    과목번호 INT,
    취소날짜 DATE,
    PRIMARY KEY (학번, 과목번호),
    FOREIGN KEY (학번) REFERENCES 학생(학번),
    FOREIGN KEY (과목번호) REFERENCES 교과목(과목번호)
);

-- 멘토링 테이블 (학생 간의 관계)
CREATE TABLE 멘토링 (
    학번 INT,
    멘토 INT,
    PRIMARY KEY (학번, 멘토),
    FOREIGN KEY (학번) REFERENCES 학생(학번),
    FOREIGN KEY (멘토) REFERENCES 학생(학번)
);

-- 학회 테이블 (학생을 참조)
CREATE TABLE 학회 (
    학번 INT PRIMARY KEY,
    FOREIGN KEY (학번) REFERENCES 학생(학번)
);
