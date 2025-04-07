import React, {useState} from "react";
import "../components/UserInfo.css"; // file CSS bạn đã có
const user = JSON.parse(localStorage.getItem("user"));

const ProfileModal = ({onClose, user}) => {
    const [gender, setGender] = useState("");
    const [avatarSrc, setAvatarSrc] = useState(user.avatar);

    const handleImageChange = (e) => {
        const file = e.target.files[0];
        if (file) {
            const imageURL = URL.createObjectURL(file);
            setAvatarSrc(imageURL);
        }
    };

    return (
        <div className="modal-overlay-user">
            <div className="modal-card">
                <button className="close-button-user" onClick={onClose}>
                    &times;
                </button>
                <div className="modal-content">
                    <h2 className="modal-title">Thông tin cá nhân</h2>

                    <div className="modal-body">
                        {/* Avatar */}
                        <div className="avatar-section">
                            <div className="avatar-box">
                                {avatarSrc ? (
                                    <img src={avatarSrc} alt="avatar" className="avatar-preview"/>
                                ) : (
                                    <span className="avatar-initial">K</span>
                                )}
                                <label className="camera-label">
                                    <input
                                        type="file"
                                        accept="image/*"
                                        className="camera-input"
                                        onChange={handleImageChange}
                                    />
                                    <img
                                        src="https://img.icons8.com/ios-filled/20/000000/camera.png"
                                        alt="camera"
                                    />
                                </label>
                            </div>

                            <p className="email-text"> {user.email}</p>
                        </div>

                        {/* Form */}
                        <div className="form-section">
                            <div className="form-group mb-2">
                                <input type="text" placeholder="Tên" value={user.username}/>
                                <input type="email" placeholder="Email" value={user.email}/>
                            </div>

                            <div className="form-group mb-2">
                                <input type="date" placeholder="Ngày sinh"/>
                                <input type="text" placeholder="Số điện thoại"/>
                            </div>

                            <div className="form-group mb-2">
                                <input type="text" placeholder="Trường học"/>
                                <select>
                                    <option>Chọn lớp của bạn</option>
                                    <option>Lớp 1</option>
                                    <option>Lớp 2</option>
                                </select>
                            </div>

                            <div className="gender-group mb-2">
                                <label>Giới tính:</label>
                                <label>
                                    <input
                                        type="radio"
                                        name="gender"
                                        value="female"
                                        onChange={() => setGender("female")}
                                    />
                                    Nữ
                                </label>
                                <label>
                                    <input
                                        type="radio"
                                        name="gender"
                                        value="male"
                                        onChange={() => setGender("male")}
                                    />
                                    Nam
                                </label>
                            </div>
                            <div className="btn-change-pass">
                                <button className="outline-button mb-2">🔒 Đổi mật khẩu</button>
                            </div>
                            <div className="btn-update-user">
                                <button className="primary-button mb-2">Cập nhật</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ProfileModal;
