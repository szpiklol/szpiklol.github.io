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

        /* OBRAZEK 1 - HITLER (Lata przez 5 sekund) */
        #flyingImage1 {
            position: fixed;
            width: 200px;
            height: auto;
            z-index: 9999;
            display: none;
            pointer-events: none;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(255, 0, 0, 0.9);
        }

        .fly-and-spin-1 {
            display: block !important;
            animation: flySpinAnim1 5s linear forwards;
        }

        @keyframes flySpinAnim1 {
            0% {
                top: 5%; left: 5%;
                transform: rotate(0deg);
                opacity: 1;
            }
            25% {
                top: 65%; left: 75%;
                transform: rotate(1080deg);
            }
            50% {
                top: 15%; left: 70%;
                transform: rotate(2160deg);
            }
            75% {
                top: 70%; left: 10%;
                transform: rotate(3240deg);
                opacity: 1;
            }
            100% {
                top: 40%; left: 45%;
                transform: rotate(4320deg);
                opacity: 0;
            }
        }

        /* OBRAZEK 2 - ŻOŁNIERZ (Lata przez 5 sekund w drugą stronę) */
        #flyingImage2 {
            position: fixed;
            width: 200px;
            height: auto;
            z-index: 9998;
            display: none;
            pointer-events: none;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(0, 150, 255, 0.9);
        }

        .fly-and-spin-2 {
            display: block !important;
            animation: flySpinAnim2 5s linear forwards;
        }

        @keyframes flySpinAnim2 {
            0% {
                top: 75%; left: 80%;
                transform: rotate(0deg);
                opacity: 1;
            }
            25% {
                top: 10%; left: 15%;
                transform: rotate(-1080deg);
            }
            50% {
                top: 75%; left: 20%;
                transform: rotate(-2160deg);
            }
            75% {
                top: 15%; left: 80%;
                transform: rotate(-3240deg);
                opacity: 1;
            }
            100% {
                top: 50%; left: 50%;
                transform: rotate(-4320deg);
                opacity: 0;
            }
        }

        /* BANER OSTRZEGAWCZY */
        .warning-box {
            display: none;
            background: #8b0000;
            border: 3px solid #ff0000;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            max-width: 600px;
            width: 90%;
            box-shadow: 0 0 30px rgba(255, 0, 0, 0.7);
        }

        .warning-box h1 {
            color: #ff3333;
            margin-top: 0;
            font-size: 26px;
            text-transform: uppercase;
        }

        .warning-box p {
            font-size: 18px;
            line-height: 1.4;
            margin: 15px 0;
        }

        .timer {
            font-size: 48px;
            font-weight: bold;
            color: #ffff00;
            font-family: monospace;
            margin-top: 10px;
            text-shadow: 0 0 10px #ff0000;
        }

        /* PRZYCISK "WPŁAĆ" PRZENOSZĄCY NA SIEPOMAGA */
        .pay-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 18px 45px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            font-size: 26px;
            font-weight: bold;
            border-radius: 10px;
            border: 2px solid #ffffff;
            box-shadow: 0 0 20px rgba(40, 167, 69, 0.9);
            transition: transform 0.2s, background-color 0.2s;
            cursor: pointer;
        }

        .pay-btn:hover {
            background-color: #218838;
            transform: scale(1.08);
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

    <!-- Baner ostrzegawczy -->
    <div class="warning-box" id="warningBox">
        <h1>OSTRZEŻENIE SYSTEMOWE!</h1>
        <p>Jeśli nie wpłacisz <strong>50 zł na Siepomaga</strong>, Twoje dane zostaną przesłane do:</p>
        <p style="color: #ffff00; font-weight: bold; font-size: 20px;">yiong comunnity King Off the CHINA Republic</p>
        <p>Czas na wykonanie wpłaty:</p>
        <div class="timer" id="countdown">10:00</div>
        
        <!-- PRZYCISK WPŁAĆ -->
        <div>
            <a href="https://www.siepomaga.pl" target="_blank" class="pay-btn">WPŁAĆ</a>
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

    <!-- Obrazek 1: Hitler -->
    <img id="flyingImage1" src="https://upload.wikimedia.org/wikipedia/commons/e/e1/Hitler_portrait_crop.jpg" alt="Obrazek 1">

    <!-- Obrazek 2: Żołnierz z pistoletem (wbudowany bezpośrednio w kod) -->
    <img id="flyingImage2" src="https://i.ibb.co/3YhGz8N/zolnierz.png" alt="Obrazek 2">

    <!-- Hymn Niemiec -->
    <audio id="anthemAudio" loop preload="auto">
        <source src="https://upload.wikimedia.org/wikipedia/commons/a/a4/German_national_anthem_performed_by_the_US_Navy_Band.ogg" type="audio/ogg">
    </audio>

    <script>
        const acceptBtn = document.getElementById('acceptBtn');
        const modal = document.getElementById('modal');
        const audio = document.getElementById('anthemAudio');
        const img1 = document.getElementById('flyingImage1');
        const img2 = document.getElementById('flyingImage2');
        const warningBox = document.getElementById('warningBox');
        const countdownEl = document.getElementById('countdown');

        acceptBtn.addEventListener('click', () => {
            // 1. Zamknij okno regulaminu i pokaż baner
            modal.style.display = 'none';
            warningBox.style.display = 'block';

            // 2. Włącz hymn Niemiec
            audio.play().catch(err => console.log("Błąd odtwarzania audio:", err));

            // 3. Uruchom obydwa latające obrazki (na 5 sekund)
            img1.classList.add('fly-and-spin-1');
            img2.classList.add('fly-and-spin-2');

            // Ukryj latające obrazki po 5 sekundach
            setTimeout(() => {
                img1.classList.remove('fly-and-spin-1');
                img2.classList.remove('fly-and-spin-2');
                img1.style.display = 'none';
                img2.style.display = 'none';
            }, 5000);

            // 4. Zatrzymaj hymn po 15 sekundach
            setTimeout(() => {
                audio.pause();
                audio.currentTime = 0;
            }, 15000);

            // 5. Uruchom odliczanie 10 minut
            startTimer(10 * 60);
        });

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
                    countdownEl.textContent = "00:00";
                }
            }, 1000);
        }
    </script>
</body>
</html>
