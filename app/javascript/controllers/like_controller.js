import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["likeButton"]

  connect() {
    this.setLiked(this.element.dataset.liked === "true")
  }

  setLiked(flag) {
    this.likeButtonTarget.textContent = flag ? "★" : "☆"
  }

  like_article() {
    const articleID = this.element.dataset.articleId

    Rails.ajax({
      url: `/api/v1/articles/${articleID}/like`,
      type: "post",
      success: ({ state }) => {
        this.setLiked(state === "liked")
      },
      error: (err) => {
        console.log(err)
      },
    })
  }
}
