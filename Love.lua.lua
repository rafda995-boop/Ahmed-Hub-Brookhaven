<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>دراما شو - عالم الدراما القصيرة</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <div class="app-container">
        <main id="video-feed" class="video-feed">
            </main>

        <nav class="bottom-nav">
            <div class="nav-item active"><i class="fas fa-home"></i><span>الرئيسية</span></div>
            <div class="nav-item"><i class="fas fa-search"></i><span>اكتشف</span></div>
            <div class="nav-item add-btn"><i class="fas fa-plus"></i></div>
            <div class="nav-item"><i class="fas fa-heart"></i><span>المفضلة</span></div>
            <div class="nav-item"><i class="fas fa-user"></i><span>حسابي</span></div>
        </nav>
    </div>

    <script src="script.js"></script>
</body>
</html>
:root {
    --primary-color: #ff2d55;
    --bg-black: #010101;
    --text-white: #ffffff;
    --nav-bg: #000000;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: var(--bg-black);
    color: var(--text-white);
    overflow: hidden; /* لمنع التمرير الخارجي */
}

.app-container {
    width: 100%;
    height: 100vh;
    display: flex;
    flex-direction: column;
}

.video-feed {
    height: calc(100vh - 70px);
    overflow-y: scroll;
    scroll-snap-type: y mandatory; /* ميزة التمرير المغناطيسي */
}

/* إخفاء شريط التمرير */
.video-feed::-webkit-scrollbar {
    display: none;
}

.video-card {
    position: relative;
    width: 100%;
    height: 100%;
    scroll-snap-align: start;
    background: #000;
    display: flex;
    align-items: center;
    justify-content: center;
}

.video-player {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* واجهة التحكم الجانبية */
.side-actions {
    position: absolute;
    right: 15px;
    bottom: 100px;
    display: flex;
    flex-direction: column;
    gap: 20px;
    align-items: center;
}

.action-btn {
    display: flex;
    flex-direction: column;
    align-items: center;
    font-size: 13px;
    cursor: pointer;
}

.action-btn i {
    font-size: 28px;
    margin-bottom: 5px;
}

.action-btn .fa-heart.liked { color: var(--primary-color); }

/* تفاصيل الفيديو السفلية */
.video-info {
    position: absolute;
    bottom: 20px;
    left: 15px;
    right: 70px;
    text-align: right;
}

.video-info h3 { margin-bottom: 8px; font-size: 18px; }
.video-info p { font-size: 14px; opacity: 0.9; }

/* القائمة السفلية */
.bottom-nav {
    height: 70px;
    background: var(--nav-bg);
    display: flex;
    justify-content: space-around;
    align-items: center;
    border-top: 1px solid #333;
}

.nav-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    font-size: 10px;
    color: #888;
    cursor: pointer;
}

.nav-item.active { color: white; }
.nav-item i { font-size: 20px; margin-bottom: 4px; }
.add-btn i {
    font-size: 30px;
    color: var(--primary-color);
}
// بيانات تجريبية (يمكن استبدالها برابط API مستقبلاً)
const dramaData = [
    {
        id: 1,
        title: "@Drama_Star",
        description: "الحلقة الأولى: اللقاء الغامض 🎬 #دراما #قصص",
        url: "https://www.w3schools.com/html/mov_bbb.mp4", // فيديو تجريبي
        likes: "1.2M"
    },
    {
        id: 2,
        title: "@Action_Hero",
        description: "هروب مستحيل! شاهد النهاية الصادمة 💥",
        url: "https://www.w3schools.com/html/movie.mp4", // فيديو تجريبي
        likes: "850K"
    }
];

const videoFeed = document.getElementById('video-feed');

// وظيفة لإنشاء كارت الفيديو
function createVideoCard(video) {
    const card = document.createElement('div');
    card.className = 'video-card';
    card.innerHTML = `
        <video class="video-player" loop>
            <source src="${video.url}" type="video/mp4">
        </video>
        
        <div class="side-actions">
            <div class="action-btn" onclick="toggleLike(this)">
                <i class="fas fa-heart"></i>
                <span>${video.likes}</span>
            </div>
            <div class="action-btn">
                <i class="fas fa-comment-dots"></i>
                <span>4.5K</span>
            </div>
            <div class="action-btn">
                <i class="fas fa-share"></i>
                <span>مشاركة</span>
            </div>
        </div>

        <div class="video-info">
            <h3>${video.title}</h3>
            <p>${video.description}</p>
        </div>
    `;

    // التحكم في التشغيل/الإيقاف عند الضغط
    card.addEventListener('click', () => {
        const v = card.querySelector('video');
        v.paused ? v.play() : v.pause();
    });

    return card;
}

// رندرة الفيديوهات
dramaData.forEach(item => {
    videoFeed.appendChild(createVideoCard(item));
});

// ميزة التشغيل التلقائي عند التمرير (Intersection Observer)
const observerOptions = {
    threshold: 0.7
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        const video = entry.target.querySelector('video');
        if (entry.isIntersecting) {
            video.play();
        } else {
            video.pause();
            video.currentTime = 0;
        }
    });
}, observerOptions);

document.querySelectorAll('.video-card').forEach(card => observer.observe(card));

// وظيفة الإعجاب Simple Toggle
function toggleLike(element) {
    const icon = element.querySelector('i');
    icon.classList.toggle('liked');
    icon.classList.toggle('fa-solid'); // تغيير شكل القلب
                  }
