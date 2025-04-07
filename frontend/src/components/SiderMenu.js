import React, {useState, useEffect} from "react";
import {Link, useNavigate} from "react-router-dom";
import {Menu, MenuItem} from "@mui/material"; // Import Menu và MenuItem từ Material UI
import "../components/SiderMenu.css";
import ProfileModal from "../components/UserInfo";
import Login from "../components/Login";
import Register from "../components/Register";
import Settings from '@mui/icons-material/Settings';
import Logout from '@mui/icons-material/Logout';
import Avatar from '@mui/material/Avatar';
import ListItemIcon from '@mui/material/ListItemIcon';

function SiderMenu() {
    const user = JSON.parse(localStorage.getItem("user"));
    const navigate = useNavigate();
    const [redirectTo, setRedirectTo] = useState("/");

    const [modalType, setModalType] = useState(null);
    const [anchorEl, setAnchorEl] = useState(null); // Để xác định vị trí mở dropdown menu
    const [mode, setMode] = useState(null); // null | 'login' | 'register'

    useEffect(() => {
        // Khi đóng modal login, nếu mode là 'register' thì mở modal register
        if (modalType === null && window.mode === 'register') {
            window.mode = null;
            setModalType('register');
        } else if (modalType === null && window.mode === 'login') {
            window.mode = null;
            setModalType('login');
        }
    }, [modalType, window.mode]);


    const handleLogout = () => {
        localStorage.removeItem("token");
        localStorage.removeItem("user");
        navigate("/");
    };

    const openMenu = (event) => {
        setAnchorEl(event.currentTarget); // Mở menu khi click vào người dùng
    };

    const closeMenu = () => {
        setAnchorEl(null); // Đóng menu
    };

    const handleOptionClick = (option) => {
        if (option === "logout") {
            handleLogout();
        } else if (option === "profile") {
            setModalType("profile"); // Mở modal thông tin người dùng
        } else if (option === "result") {
            // setModalType("profile"); // Mở modal ket qua
        }
        closeMenu(); // Đóng menu sau khi chọn một tùy chọn
    };


    useEffect(() => {
        if (user && user.role === "S") {
            setRedirectTo("/home-student");
        } else if (user && user.role === "T") {
            setRedirectTo("/teacher");
        } else {
            setRedirectTo("/"); // Nếu không có role, điều hướng về trang chủ
        }

    }, [user, navigate]);


    return (
        <>
            <nav className="navbar navbar-expand-lg navbar-dark" style={{background: "#72d2e1"}}>
                <div className="container">
                    <Link className="navbar-brand" to={redirectTo}>
                        <img
                            src="/logo.svg"
                            alt="Logo"
                            style={{width: "200px", height: "auto", marginRight: "10px"}}
                        />
                        {/* THI TRẮC NGHIỆM */}
                    </Link>
                    <div className="collapse navbar-collapse">
                        <ul
                            className="navbar-nav ms-auto"
                            style={{
                                display: "flex",
                                alignItems: "center",
                                justifyContent: "space-evenly",
                                width: "28%"
                            }}
                        >
                            {user ? (
                                <>
                                    <li className="nav-item" style={{display: "inline-block", marginRight: "10px"}}>
                                        <span className="nav-link text-light">
                                            Xin chào,
                                            <button
                                                className="custom-button"
                                                style={{
                                                    textDecoration: "underline",
                                                    color: "white",
                                                    background: "none",
                                                    border: "none",
                                                    padding: 0,
                                                    display: "inline",
                                                    cursor: "pointer",
                                                }}
                                                onClick={openMenu} // Mở menu khi click vào tên người dùng
                                            >
                                                {user.username}
                                                <img
                                                    src={user?.avatar}
                                                    alt="avatar"
                                                    style={{
                                                        width: "30px",
                                                        height: "30px",
                                                        borderRadius: "50%",
                                                        marginLeft: "10px",
                                                        objectFit: "cover",
                                                    }}
                                                />
                                            </button>
                                        </span>
                                    </li>
                                </>
                            ) : (
                                <>
                                    <button
                                        className="custom-button"
                                        onClick={() => setModalType("login")}
                                    >
                                        Đăng Nhập
                                    </button>
                                    <button
                                        className="custom-button"
                                        onClick={() => setModalType("register")}
                                    >
                                        Đăng ký
                                    </button>
                                </>
                            )}
                        </ul>
                    </div>
                </div>
            </nav>

            {/* Menu phụ bên dưới */}
            <div className="py-2 sticky-menu">
                <div className="container">
                    <ul className="nav justify-content-center">
                        <li className="nav-item">
                            {/*to={`/questions/${user.id}`}*/}
                            <Link className="nav-link" to="/home-student">Trang Học Sinh</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/tai-lieu">Tài Liệu</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/gioi-thieu">Giới Thiệu</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/lien-he">Liên Hệ</Link>
                        </li>
                    </ul>
                </div>
            </div>

            {/* Dropdown menu */}
            <Menu
                // className="dropdown-menu"
                anchorEl={anchorEl}
                open={Boolean(anchorEl)} // Kiểm tra nếu menu mở
                onClose={closeMenu} // Đóng menu khi click ra ngoài
                slotProps={{
                    paper: {
                        elevation: 0,
                        sx: {
                            overflow: 'visible',
                            filter: 'drop-shadow(0px 2px 8px rgba(0,0,0,0.32))',
                            mt: 1.5,
                            '& .MuiAvatar-root': {
                                width: 32,
                                height: 32,
                                ml: -0.5,
                                mr: 1,
                            },
                            '&::before': {
                                content: '""',
                                display: 'block',
                                position: 'absolute',
                                top: 0,
                                right: 14,
                                width: 10,
                                height: 10,
                                bgcolor: 'background.paper',
                                transform: 'translateY(-50%) rotate(45deg)',
                                zIndex: 0,
                            },
                        },
                    },
                }}
                transformOrigin={{horizontal: 'right', vertical: 'top'}}
                anchorOrigin={{horizontal: 'right', vertical: 'bottom'}}
            >
                <MenuItem onClick={() => handleOptionClick("profile")}> <Avatar/> Thông tin cá nhân</MenuItem>
                <MenuItem onClick={() => handleOptionClick("result")}> <ListItemIcon>
                    <Settings fontSize="small"/>
                </ListItemIcon>Kết quả học tập</MenuItem>
                <MenuItem onClick={() => handleOptionClick("logout")}> <ListItemIcon>
                    <Logout fontSize="small"/>
                </ListItemIcon>Đăng xuất</MenuItem>
            </Menu>

            {modalType === "profile" && <ProfileModal onClose={() => setModalType(null)} user={user}/>}
            {modalType === "login" && <Login onClose={() => setModalType(null)}/>}
            {modalType === "register" && <Register onClose={() => setModalType(null)}/>}
        </>
    );
}

export default SiderMenu;
