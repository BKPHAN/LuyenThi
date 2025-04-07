import React, { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";
import "../pages/css/Home.css";
import CourseCard from "../components/CourseCard";

function Home() {
    const [showButton, setShowButton] = useState(false);

    const courses = [
        {
            title: "Toán tư duy",
            description: "Giúp bé phát triển tư duy logic và khả năng giải quyết vấn đề.",
            image: "1.jpg"
        },
        {
            title: "Scratch cơ bản",
            description: "Khóa học lập trình cho trẻ em thông qua trò chơi sinh động.",
            image: "2.jpg"
        },
        {
            title: "Tiếng Anh giao tiếp",
            description: "Tăng cường kỹ năng nghe nói tiếng Anh với giáo viên bản ngữ.",
            image: "3.jpg"
        }
    ];

    const knowledge = [
        {
            title: "Toán tư duy",
            description: "Giúp bé phát triển tư duy logic và khả năng giải quyết vấn đề.",
            image: "1.jpg"
        },
        {
            title: "Scratch cơ bản",
            description: "Khóa học lập trình cho trẻ em thông qua trò chơi sinh động.",
            image: "2.jpg"
        },
        {
            title: "Tiếng Anh giao tiếp",
            description: "Tăng cường kỹ năng nghe nói tiếng Anh với giáo viên bản ngữ.",
            image: "3.jpg"
        }
    ];

    const carouselItems = [
        { image: "/assets/4.jpg", alt: "Slide 1" },
        { image: "/assets/5.jpg", alt: "Slide 2" },
        { image: "/assets/6.jpg", alt: "Slide 3" }
    ];

    useEffect(() => {
        const handleScroll = () => {
            if (window.scrollY > 300) {  // Hiển thị button khi cuộn xuống 300px
                setShowButton(true);
            } else {
                setShowButton(false);
            }
        };

        window.addEventListener("scroll", handleScroll);
        return () => {
            window.removeEventListener("scroll", handleScroll);
        };
    }, []);

    const scrollToTop = () => {
        window.scrollTo({ top: 0, behavior: "smooth" });
    };

    return (
        <div className="container mt-5">
            {/* === SLIDESHOW === */}
            <div id="mainCarousel" className="carousel slide mb-5" data-bs-ride="carousel" data-bs-interval="3000">
                <div className="carousel-inner rounded shadow">
                    {carouselItems.map((item, index) => (
                        <div
                            className={`carousel-item ${index === 0 ? "active" : ""}`}
                            key={index}
                        >
                            <img
                                src={item.image}
                                className="d-block w-100"
                                alt={item.alt}
                                style={{ maxHeight: '500px', objectFit: 'cover' }}
                            />
                        </div>
                    ))}
                </div>

                {/* Điều khiển */}
                <button className="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                    <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button className="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                    <span className="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
            </div>

            {/* === GIỚI THIỆU === */}
            <div className="card shadow-lg p-5 bg-custom text-center mb-5">
                <h1 className="text-main display-4">Trang Chủ</h1>
                <p className="text-subtle lead">Chào mừng bạn đến với hệ thống thi trắc nghiệm!</p>
                <hr className="my-4" />
                <p className="text-muted">
                    Nền tảng thi trắc nghiệm trực tuyến với hàng ngàn đề thi đa dạng. Hãy đăng ký ngay để trải nghiệm!
                </p>
            </div>

            {/* === KHÓA HỌC === */}
            <div className="mb-4">
                <h2 className="text-center text-primary mb-4">Khóa học nổi bật</h2>
                <div className="row">
                    {courses.map((course, index) => (
                        <div className=" col-md-4 mb-4" key={index}>
                            <CourseCard {...course} />
                        </div>
                    ))}
                </div>
            </div>

            {/* === KIẾN THỨC === */}
            <div className="mb-4">
                <h2 className="text-center text-primary mb-4">Kiến thức hay</h2>
                <div className="row">
                    {courses.map((course, index) => (
                        <div className=" col-md-4 mb-4" key={index}>
                            <CourseCard {...course} />
                        </div>
                    ))}
                </div>
            </div>

            {/* === BUTTON "LÊN ĐẦU TRANG" === */}
            {showButton && (
                <button
                    className="btn btn-primary scroll-to-top"
                    style={{
                        position: 'fixed',
                        bottom: '20px',
                        right: '20px',
                        zIndex: 1000,
                        borderRadius: '50%',
                        padding: '10px 20px',
                    }}
                    onClick={scrollToTop}
                >
                    ↑
                </button>
            )}
        </div>
    );
}

export default Home;
