function getCookieValue() {
  return document.cookie;
}

function hasAcceptedCookies() {
  return getCookieValue().includes("cookies=accepted");
}

function hasDeclinedCookies() {
  return getCookieValue().includes("cookies=declined");
}

function setChoice(value) {
  document.cookie = `cookies=${value}; SameSite=strict; Secure`;
}

function hideChoiceManager() {
  document.querySelector(".js-choice-manager").style.display = "none";
  document.body.classList.remove("choice-manager-spacing");
}

function loadGoogleMaps() {
  const placeholder = document.querySelector(".js-map-placeholder");
  if (!placeholder) {
    return;
  }

  placeholder.style.display = "none";
  const map = document.querySelector(".js-map");
  map.setAttribute("src", map.dataset.src);
  map.style.display = "block";
}

document.addEventListener("DOMContentLoaded", () => {
  const manager = document.querySelector(".js-choice-manager");
  document.querySelectorAll(".js-cookie-accept").forEach(function(item) {
    item.addEventListener("click", function(e) {
      setChoice("accepted");
      hideChoiceManager();
      loadGoogleMaps();
      updateStatusElement();
    });
  });
  document.querySelectorAll(".js-cookie-decline").forEach(function(item) {
    item.addEventListener("click", function(e) {
      setChoice("declined");
      hideChoiceManager();
      updateStatusElement();
    });
  });

  if (hasAcceptedCookies()) {
    loadGoogleMaps();
  }
  if (!getCookieValue()) {
    document.body.classList.add("choice-manager-spacing");
  }
  updateStatusElement();
});

function updateStatusElement() {
  const statusElement = document.querySelector(".js-choice-status");
  if (!statusElement) {
    return;
  }

  let message = "Not accepted cookies";
  if (hasAcceptedCookies()) {
    message = "Accepted cookies";
  } else if (hasDeclinedCookies()) {
    message = "Declined cookies";
  }
  statusElement.textContent = message;
}

window.addEventListener("scroll", (e) => {
  if (document.cookie.includes("cookies=")) {
    // Keep cookie manager hidden if the user has already chosen
    return;
  }
  // Show cookie manager after a little scrolling
  if (window.pageYOffset > 100) {
    document.querySelector(".js-choice-manager").classList.add("choice-manager-visible");
  }
});
