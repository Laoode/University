function hitung() {
  var na = parseFloat(document.getElementById("na").value);
  var nb = parseFloat(document.getElementById("nb").value);
  var operasi = 0;

  if ((document.getElementById("op").value = "jum")) {
    operasi = na + nb;
  } else if ((document.getElementById("op").value = "kur")) {
    operasi = na - nb;
  } else if ((document.getElementById("op").value = "kal")) {
    operasi = na * nb;
  } else if ((document.getElementById("op").value = "bag")) {
    operasi = na / nb;
  }

  alert(operasi);
}

function kelipatan() {
  const kel = [60, 50, 89, 90, 45, 65, 85, 88, 100, 52];
  bilangan = 0;
  ukan = 0;
  for (const i of kel) {
    if (i % 5 == 0) {
      bilangan += 1;
    } else {
      ukan += 1;
    }
  }
  alert(bilangan);
}

function Push() {
  let kel = [60, 50, 89, 90, 45, 65, 85, 88, 100, 52];
  kel.push(10);
  document.getElementById("demo").innerHTML = kel.join(", ");
}
