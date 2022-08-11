import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["likeButton"]

  connect() {
    if (this.element.dataset.liked === "true") {
      this.likeButtonTarget.textContent = "★"
    } else {
      this.likeButtonTarget.textContent = "☆"
    }
  }

  like_article() {
    const articleID = this.element.dataset.articleId

    Rails.ajax({
      url: `/api/v1/articles/${articleID}/like`,
      type: "post",
      success: ({ state }) => {
        if (state === "liked") {
          this.likeButtonTarget.textContent = "★"
        } else {
          this.likeButtonTarget.textContent = "☆"
        }
      },
      error: (err) => {
        console.log(err)
      },
    })
  }
}
