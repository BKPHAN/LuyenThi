// src/components/RegisterModal.js
import React, {useState} from "react";
import axios from "axios";
import "./Register.css";
import Login from "./Login";

function RegisterModal({onClose}) {
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [message, setMessage] = useState("");
    const [successMessage, setSuccessMessage] = useState("");
    const [modalType, setModalType] = useState(null);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setMessage("");
        setSuccessMessage("");

        let role = "";
        if (email.endsWith("@student.com")) {
            role = "student";
        } else if (email.endsWith("@teacher.com")) {
            role = "teacher";
        } else {
            setMessage("Email phải có đuôi @student.com hoặc @teacher.com!");
            return;
        }

        try {
            const response = await axios.post("http://localhost:5001/register", {
                name,
                email,
                password,
                role,
            });

            setSuccessMessage("Đăng ký thành công!");
            setTimeout(() => {
                onClose(); // Đóng popup sau khi đăng ký thành công
            }, 2000);
        } catch (error) {
            setMessage(error.response?.data?.error || "Lỗi đăng ký!");
        }
    };

    return (
        <div className="modal-overlay-register">
            <div className="card p-4 shadow register-card">
                <button className="close-button" onClick={onClose}>&times;</button>
                <h2 className="text-center text-primary">Đăng Ký</h2>

                {successMessage && <p className="text-center text-success">{successMessage}</p>}
                {message && <p className="text-center text-danger">{message}</p>}

                <form onSubmit={handleSubmit}>
                    <div className="mb-2">
                        <label className="form-label">Họ và Tên</label>
                        <input
                            type="text"
                            className="form-control"
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                            required
                        />
                    </div>
                    <div className="mb-2">
                        <label className="form-label">Email</label>
                        <input
                            type="email"
                            className="form-control"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            required
                        />
                    </div>
                    <div className="mb-2">
                        <label className="form-label">Mật khẩu</label>
                        <input
                            type="password"
                            className="form-control"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            required
                        />
                    </div>
                    <button type="submit" className="btn btn-primary w-100 register-btn">
                        Đăng Ký
                    </button>

                    <div className="text-center my-3 separator">HOẶC</div>

                    <button
                        type="button"
                        className="btn btn-light w-100 d-flex align-items-center justify-content-center gap-2 mb-2"
                    >
                        <img
                            src="https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg"
                            alt="Google"
                            width="20"
                        />
                        <span>Đăng nhập với Google</span>
                    </button>

                    <div className="text-center">
                        <span>Bạn đã có tài khoản? </span>
                        <a href="#" className="text-decoration-none text-primary">
                            <button
                                className="custom-button"
                                style={{
                                    textDecoration: "underline",
                                    color: "darkblue",
                                    background: "none",
                                    border: "none",
                                    padding: 0,
                                    display: "inline",
                                    cursor: "pointer",
                                }}
                                onClick={() => {
                                    setModalType("login");
                                    // onClose();
                                }}
                            > Đăng nhập ngay
                            </button>

                        </a>
                    </div>
                </form>
            </div>
            {modalType === "login" && <Login onClose={() => setModalType(null)}/>}
        </div>
    );
}

export default RegisterModal;
