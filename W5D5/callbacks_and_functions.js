
window.setTimeout(
  () => {
    alert('HAMMERTIME');
  }, 5000
);


function hammerTime (time) {
  window.setTimeout(
    () => {
      alert(`${time} is HAMMER TIME!`);
    }, time
  );
}

hammerTime (1000);












//
