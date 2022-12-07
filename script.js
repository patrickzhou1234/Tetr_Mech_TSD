function rotate() {
    document.body.dispatchEvent(new KeyboardEvent("keydown", {
        key: "ArrowUp",
        keyCode: 38,
        code: "ArrowUp",
        which: 38,
        shiftKey: false,
        ctrlKey: false,
        metaKey: false
    }));
}

window.onkeydown = function(event) {
    if (event.keyCode == "192") {
        rotate();
    }
}