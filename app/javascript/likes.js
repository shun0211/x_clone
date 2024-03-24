document.addEventListener('DOMContentLoaded', () => {
  const likeButtons = document.querySelectorAll('.like-button');
  likeButtons.forEach((button) => {
    button.addEventListener('click', (event) => {
      console.log('いいねボタンがクリックされました！')

      event.preventDefault(); // 画面遷移のイベントをキャンセル

      // いいねボタンがすでに押されているかどうか
      const heartIcon = button.querySelector('.heart-icon');
      const hasLiked = heartIcon.classList.contains('liked');

      const tweetId = button.dataset.tweetId;
      let apiPath = `/api/tweets/${tweetId}/likes`;
      let method = hasLiked ? 'DELETE' : 'POST';

      fetch(apiPath, {
        method,
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({
          tweet_id: tweetId,
          authenticity_token: document.querySelector('[name="csrf-token"]').content
        })
      })
        .then(response => response.json())
        .then(data => {
          if (hasLiked) {
            // いいねを取り消した場合
            const likeCount = button.querySelector('.like-count');
            heartIcon.classList.remove('bi-heart-fill', 'liked');
            heartIcon.classList.add('bi-heart');
            likeCount.textContent = data.like_count;
            likeCount.classList.remove('liked');
          } else {
            // いいねを押した場合
            const likeCount = button.querySelector('.like-count');
            heartIcon.classList.remove('bi-heart');
            heartIcon.classList.add('bi-heart-fill', 'liked');
            likeCount.textContent = data.like_count;
            likeCount.classList.add('liked');
          }
        })
        .catch(error => {
          // 通信失敗時の処理
        });
    });
  });
});