/* Anki Note Linker */

var SELECTOR = ".linkRender";

if (!window.AnkiNoteLinkerIsActive) {
  const renderLinks = () => {
    document.querySelectorAll(SELECTOR).forEach((element) => {
      element.innerHTML = element.innerHTML.replace(
        /\[((?:[^\[]|\\\[)*)\|nid(\d{13})\]/g,
        (match, title, nid) => {
          title = title.replace(/\\\[/g, "[");
          let link;
          if (
            document.documentElement.classList.contains("iphone") ||
            document.documentElement.classList.contains("ipad")
          ) {
            link = `anki://x-callback-url/search?query=nid%3a${nid}`;
          } else {
            try {
              window.jsAPI ||= new AnkiDroidJS({
                version: "0.0.3",
                developer: "github.com/gugutu",
              });
              link = `javascript:window.jsAPI.ankiSearchCard(\`nid:${nid}\`)`;
            } catch (e) {
              link = "javascript:void(0)";
            }
          }
          return `<a href='${link}'>${title}</a>`;
        },
      );
    });
  };
  document.readyState !== "loading"
    ? renderLinks()
    : document.addEventListener("DOMContentLoaded", renderLinks, {
        once: true,
      });
}
