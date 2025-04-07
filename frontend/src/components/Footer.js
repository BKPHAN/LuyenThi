import "../components/Footer.css";
import FacebookOutlinedIcon from '@mui/icons-material/FacebookOutlined';
import YouTubeIcon from '@mui/icons-material/YouTube';
import TwitterIcon from '@mui/icons-material/Twitter';
import PinterestIcon from '@mui/icons-material/Pinterest';

const Footer = () => {
    return (
        <footer className="bg-gray-100 text-gray-700 py-6 mt-12 border-t">
            <div className="container mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-6">

                {/* Cột 1: Giới thiệu */}
                <div>
                    <h3 className="font-bold text-lg mb-2">Học Thông Minh</h3>
                    <p>Nền tảng học trực tuyến giúp trẻ em phát triển tư duy và kỹ năng trong thời đại số.</p>
                </div>

                {/* Cột 2: Liên kết nhanh */}
                <div>
                    <h3 className="font-bold text-lg mb-2">Liên kết</h3>
                    <ul className="space-y-1">
                        <li><a href="/" className="hover:underline">Trang chủ</a></li>
                        <li><a href="/courses" className="hover:underline">Khóa học</a></li>
                        <li><a href="/about" className="hover:underline">Giới thiệu</a></li>
                        <li><a href="/contact" className="hover:underline">Liên hệ</a></li>
                    </ul>
                </div>

                {/* Cột 3: Liên hệ */}
                <div>
                    <h3 className="font-bold text-lg mb-2">Liên hệ</h3>
                    <p>Email: <a href="mailto:info@hocthongminh.com" className="text-blue-600 hover:underline">info@hocthongminh.com</a></p>
                    <p>Hotline: 0123 456 789</p>
                    <div className="flex space-x-4 mt-2">
                        <a href="#" className="text-blue-600 hover:text-blue-800">
                            <FacebookOutlinedIcon style={{ fontSize: 36 }} />
                        </a>
                        <a href="#" className="text-red-600 hover:text-red-800">
                            <YouTubeIcon style={{ fontSize: 42, color: 'red' }} />
                        </a>
                        <a href="#" className="text-red-600 hover:text-red-800">
                            <TwitterIcon style={{ fontSize: 36}} />
                        </a>
                        <a href="#" className="text-red-600 hover:text-red-800">
                            <PinterestIcon style={{ fontSize: 36, color: '#c10404'}} />
                        </a>
                    </div>
                </div>
            </div>

            <div className="text-center mt-6 text-sm text-gray-500">
                © 2025 Học Thông Minh. All rights reserved.
            </div>
        </footer>
    );
};

export default Footer;
