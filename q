<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona Prank</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #111;
            color: white;
            overflow: hidden;
        }

        /* STALIN - ZAWSZE WIDOCZNY W NAROŻNIKU, SZYBKO SIĘ OBRACA */
        #stalinImage {
            position: fixed;
            top: 15px;
            right: 15px;
            width: 110px;
            height: 110px;
            border-radius: 50%;
            z-index: 9990;
            display: none;
            border: 3px solid #ff0000;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.9);
            object-fit: cover;
            animation: spinFast 0.3s linear infinite;
        }

        @keyframes spinFast {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* POJAWIAJĄCE SIĘ ZDJĘCIA HITLERA */
        .hitler-pop {
            position: fixed;
            width: 120px;
            height: auto;
            z-index: 9980;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.9);
            pointer-events: none;
            object-fit: cover;
            animation: fadeInOut 1.8s ease-in-out forwards;
        }

        @keyframes fadeInOut {
            0% { opacity: 0; transform: scale(0.3); }
            20% { opacity: 1; transform: scale(1); }
            80% { opacity: 1; transform: scale(1); }
            100% { opacity: 0; transform: scale(0.3); }
        }

        /* BANER OSTRZEGAWCZY */
        .warning-box {
            display: none;
            position: relative;
            z-index: 9999; /* Zawsze widoczny na wierzchu */
            background: #8b0000;
            border: 3px solid #ff0000;
            padding: 25px;
            border-radius: 15px;
            text-align: center;
            max-width: 550px;
            width: 90%;
            box-shadow: 0 0 35px rgba(255, 0, 0, 0.8);
        }

        .warning-box h1 {
            color: #ff3333;
            margin-top: 0;
            font-size: 24px;
            text-transform: uppercase;
        }

        .warning-box p {
            font-size: 16px;
            line-height: 1.4;
            margin: 12px 0;
        }

        .timer {
            font-size: 44px;
            font-weight: bold;
            color: #ffff00;
            font-family: monospace;
            margin-top: 10px;
            text-shadow: 0 0 10px #ff0000;
        }

        /* PRZYCISK WPŁAĆ */
        .pay-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 16px 40px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
            border-radius: 10px;
            border: 2px solid #ffffff;
            box-shadow: 0 0 20px rgba(40, 167, 69, 0.9);
            transition: transform 0.2s, background-color 0.2s;
            cursor: pointer;
        }

        .pay-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* SEKCJA SUWAKA / WYSYŁANIA DANYCH */
        .sending-box {
            display: none;
            margin-top: 20px;
            background: rgba(0, 0, 0, 0.6);
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #ff0000;
        }

        .sending-box label {
            display: block;
            font-size: 15px;
            color: #ffaaaa;
            margin-bottom: 10px;
        }

        .sending-slider {
            width: 100%;
            height: 15px;
            accent-color: #ff0000;
        }

        .status-text {
            font-size: 14px;
            color: #ffff00;
            margin-top: 8px;
            font-family: monospace;
        }

        /* OKIENKO REGULAMINU */
        .modal-overlay {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.95);
            display: flex; justifyContent: center; align-items: center;
            z-index: 10000;
        }

        .modal-box {
            background: #222;
            color: #fff;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            max-width: 380px;
            border: 2px solid #ff4757;
        }

        .accept-btn {
            margin-top: 20px;
            padding: 14px 28px;
            background-color: #ff4757;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
        }

        .accept-btn:hover {
            background-color: #ff6b81;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Szybko kręcący się Stalin -->
    <img id="stalinImage" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Stalin_1930.jpg/300px-Stalin_1930.jpg" alt="Stalin">

    <!-- Baner ostrzegawczy -->
    <div class="warning-box" id="warningBox">
        <h1>OSTRZEŻENIE SYSTEMOWE!</h1>
        <p>Jeśli nie wpłacisz <strong>50 zł na Siepomaga</strong>, Twoje dane zostaną przesłane do:</p>
        <p style="color: #ffff00; font-weight: bold; font-size: 20px;">yiong comunnity King Off the CHINA Republic</p>
        <p>Czas na wykonanie wpłaty:</p>
        <div class="timer" id="countdown">01:00</div>
        
        <!-- PRZYCISK WPŁAĆ -->
        <div>
            <a href="https://www.siepomaga.pl" target="_blank" class="pay-btn">WPŁAĆ</a>
        </div>

        <!-- Sekcja wysyłania po upływie czasu -->
        <div class="sending-box" id="sendingBox">
            <label for="progressSlider" id="sendingLabel">CZAS UPŁYNĄŁ! TRWA PRZESYŁANIE DANYCH DO YIONG COMMUNITY...</label>
            <input type="range" min="0" max="100" value="0" class="sending-slider" id="progressSlider" disabled>
            <div class="status-text" id="statusText">Postęp: 0%</div>
        </div>
    </div>

    <!-- Okno regulaminu -->
    <div class="modal-overlay" id="modal">
        <div class="modal-box">
            <h2>Wymagana akceptacja</h2>
            <p>Kliknij przycisk poniżej, aby zaakceptować warunki korzystania z serwisu.</p>
            <button class="accept-btn" id="acceptBtn">AKCEPTUJĘ REGULAMIN</button>
        </div>
    </div>

    <!-- Ukryty odtwarzacz YouTube dla muzyki -->
    <iframe id="ytPlayer" style="display:none;" width="0" height="0" src="" allow="autoplay"></iframe>

    <script>
        const acceptBtn = document.getElementById('acceptBtn');
        const modal = document.getElementById('modal');
        const ytPlayer = document.getElementById('ytPlayer');
        const stalinImage = document.getElementById('stalinImage');
        const warningBox = document.getElementById('warningBox');
        const countdownEl = document.getElementById('countdown');
        const sendingBox = document.getElementById('sendingBox');
        const progressSlider = document.getElementById('progressSlider');
        const statusText = document.getElementById('statusText');

        let isLocked = true;
        let hitlerInterval;

        // Działające linki do zdjęć Hitlera
        const hitlerImages = [
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Hitler_portrait_crop.jpg/300px-Hitler_portrait_crop.jpg',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Adolf_Hitler_in_1938.jpg/300px-Adolf_Hitler_in_1938.jpg'
        ];

        // BLOKADA COFANIA (HISTORY API)
        function pushDummyState() {
            history.pushState(null, document.title, location.href);
        }
        pushDummyState();

        window.addEventListener('popstate', () => {
            if (isLocked) {
                pushDummyState();
                alert("Dostęp zablokowany! Odczekaj do końca odliczania.");
            }
        });

        window.addEventListener('beforeunload', (e) => {
            if (isLocked) {
                e.preventDefault();
                e.returnValue = '';
            }
        });

        // AKCJA PO AKCEPTACJI
        acceptBtn.addEventListener('click', () => {
            modal.style.display = 'none';
            warningBox.style.display = 'block';

            // 1. Wibracja w telefonie (seria wibracji)
            if ("vibrate" in navigator) {
                navigator.vibrate([400, 150, 400, 150, 600, 200, 400]);
            }

            // 2. Pokazanie obracającego się Stalina
            stalinImage.style.display = 'block';

            // 3. Włączenie dźwięku z YouTube
            ytPlayer.src = "https://www.youtube.com/embed/s-wVIn24brs?autoplay=1";

            // 4. Generowanie wyskakujących obrazków Hitlera
            hitlerInterval = setInterval(spawnHitlerImage, 700);

            // 5. Start odliczania 1 minuty
            startTimer(1 * 60);
        });

        // BEZPIECZNE GENEROWANIE OBRAZKÓW HITLERA
        function spawnHitlerImage() {
            const img = document.createElement('img');
            img.src = hitlerImages[Math.floor(Math.random() * hitlerImages.length)];
            img.className = 'hitler-pop';

            const imgW = 120;
            const imgH = 150;
            const boxRect = warningBox.getBoundingClientRect();

            let x, y, overlaps;
            let attempts = 0;

            // Szukanie bezpiecznego miejsca (poza banerem)
            do {
                x = Math.random() * (window.innerWidth - imgW);
                y = Math.random() * (window.innerHeight - imgH);

                overlaps = !(
                    x + imgW < boxRect.left ||
                    x > boxRect.right ||
                    y + imgH < boxRect.top ||
                    y > boxRect.bottom
                );
                attempts++;
            } while (overlaps && attempts < 25);

            img.style.left = x + 'px';
            img.style.top = y + 'px';

            document.body.appendChild(img);

            // Usunięcie obrazka z pamięci po ukończeniu animacji
            setTimeout(() => {
                img.remove();
            }, 1800);
        }

        // TIMER ODLICZANIA
        function startTimer(duration) {
            let timer = duration, minutes, seconds;
            const interval = setInterval(() => {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                countdownEl.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    clearInterval(interval);
                    clearInterval(hitlerInterval); // Zatrzymanie spamu Hitlerów
                    countdownEl.textContent = "00:00";
                    startDataTransferSimulation();
                }
            }, 1000);
        }

        // SYMULACJA SUWAKA PRZESYŁANIA DANYCH
        function startDataTransferSimulation() {
            sendingBox.style.display = 'block';
            let progress = 0;
            
            const sendInterval = setInterval(() => {
                progress += 2;
                if (progress > 100) progress = 100;

                progressSlider.value = progress;
                statusText.textContent = "Postęp: " + progress + "% (" + (progress * 15) + " MB sent)";

                if (progress >= 100) {
                    clearInterval(sendInterval);
                    document.getElementById('sendingLabel').textContent = "DANE ZOSTAŁY POMYŚLNIE PRZESŁANE DO YIONG COMMUNITY!";
                    statusText.textContent = "Status: Zakończono pomyślnie.";
                    isLocked = false;
                }
            }, 100);
        }
    </script>
</body>
</html>
