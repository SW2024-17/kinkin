document.addEventListener('DOMContentLoaded', function () {
  const clockElement = document.getElementById('clock'); // 時計を表示する要素を取得

  function updateClock() {
    const now = new Date();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const timeString = `${hours}:${minutes}:${seconds}`;
    clockElement.textContent = timeString; // 時計を更新
  }

  setInterval(updateClock, 1000); // 毎秒更新
  updateClock(); // 初期表示
});
