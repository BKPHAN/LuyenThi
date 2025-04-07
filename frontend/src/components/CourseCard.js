import "../components/CourseCard.css";

const CourseCard = ({ title, description, image }) => {
    const handleClick = () => {
        alert(`Xem chi tiết: ${title}`);
        // Ví dụ điều hướng nếu dùng React Router:
        // navigate(`/courses/${slug}`);
    };

    return (
        <div
            className="border rounded-lg shadow hover:shadow-lg p-4 bg-white course-card cursor-pointer transition-transform duration-300 hover:scale-105"
            onClick={handleClick}
        >
            <img
                src={`/assets/${image}`}
                alt={title}
                className="h-40 w-full object-cover rounded"
                style={{ objectFit: 'cover', height: '200px', width: '300px' }}
            />
            <h3 className="mt-2 text-xl font-semibold">{title}</h3>
            <p className="text-gray-600">{description}</p>
            <button
                className="mt-2 px-4 py-1 bg-blue-500 rounded"
                onClick={(e) => {
                    e.stopPropagation(); // Ngăn sự kiện lan ra thẻ div cha
                    handleClick();
                }}
            >
                Xem chi tiết
            </button>
        </div>
    );
};

export default CourseCard;
