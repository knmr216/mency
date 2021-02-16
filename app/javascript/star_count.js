const star_count = () => {
  const stars = document.querySelector(".stars-count").children;
  const ratingValue = document.getElementById("rating-value");

  for(let i=0; i<stars.length; i++){
    stars[i].addEventListener("click", () => {
      for(let j=0; j<stars.length; j++){
        stars[j].classList.remove("fas");
        stars[j].classList.add("far");
      }
      for(let j=0; j<=i; j++){
        stars[j].classList.remove("far");
        stars[j].classList.add("fas");
      }
      ratingValue.value = i + 1;
    });
  }
};

window.addEventListener("load", star_count);