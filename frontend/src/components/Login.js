import React, {useState} from "react";
import {useNavigate} from "react-router-dom";
import "./Login.css";
import Alert from "@mui/material/Alert";
import Register from "./Register";

const LoginModal = ({onClose}) => {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [errorMessage, setErrorMessage] = useState("");
    const navigate = useNavigate();
    const [modalType, setModalType] = useState(null);

    const handleSubmit = (e) => {
        e.preventDefault();
        try {
            const domain = email.split('@')[1]?.toLowerCase();

            const role = domain?.includes("student")
                ? "S"
                : domain?.includes("teacher")
                    ? "T"
                    : null;

            if (!role) {
                setErrorMessage("Email phải chứa '@student' hoặc '@teacher' để xác định vai trò.");
                return;
            }


            const user = {
                id: 123,
                username: email.split("@")[0],
                email: email,
                role: role,
                avatar: "/avatar.png"
            };

            localStorage.setItem("user", JSON.stringify(user));

            //Chỗ này chưa biết chuyển hướng từ màn home đến các màn khác
            if (user.role === "S") {
                // navigate("/");
                navigate("/home-student");
            } else if (user.role === "T") {
                // navigate("/");
                navigate("/teacher");
            } else {
                navigate("/");
            }
            onClose();
        } catch (error) {
            setErrorMessage(
                <Alert variant="filled" severity="error">
                    {error.response?.data?.error || "Lỗi đăng nhập!"}
                </Alert>
            );
        }
    };

    return (
        <div className="modal-overlay">
            <div className="card p-4 shadow login-card">
                <button className="close-button" onClick={onClose}>&times;</button>
                <h2 className="text-center text-primary">Đăng Nhập</h2>
                {errorMessage && <p className="text-center text-danger">{errorMessage}</p>}
                <form onSubmit={handleSubmit}>
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

                    <div className="d-flex justify-content-start mb-2">
                        <a href="#" className="text-decoration-none text-primary small">
                            Quên mật khẩu?
                        </a>
                    </div>

                    <button type="submit" className="btn btn-primary w-100 login-btn">
                        Đăng Nhập
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
                        <span>Bạn chưa có tài khoản? </span>
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
                                    window.mode = 'register';
                                    onClose();
                                }}
                            >
                                Đăng ký ngay
                            </button>
                        </a>
                    </div>
                </form>
            </div>
            {/*{modalType === "register" && <Register onClose={() => setModalType(null)}/>}*/}
        </div>
    );
};

export default LoginModal;
