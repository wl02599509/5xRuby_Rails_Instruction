import { Controller } from "stimulus"
// import ax from "lib/http/client"
import Rails from "@rails/ujs"



export default class extends Controller {
  
  static targets = ["likeBtn"]

  connect() {
    // console.log(this.element.dataset.liked)
    if (this.element.dataset.liked === "true") {
      this.likeBtnTarget.textContent = "★"
    } else {
      this.likeBtnTarget.textContent = "☆"
    }
  }

  setFavorite(flag) {
    this.likeBtnTarget.textContent = flag
  }

  like_article(){
    // 打 API 到 POST /api/v1/articles/:id/like
    const articleID = this.element.dataset.articleId
 
    Rails.ajax({
      url: `/api/v1/articles/${articleID}/like`,
      type: "post",
      success: ( { status } ) => {
        if (status === "liked"){
          this.likeBtnTarget.textContent = "★"
        } else {
          this.likeBtnTarget.textContent = "☆"
        }
        console.log(status)
      },
      error: (err) => {
        console.log(err)
      },
    })

    // axios API 套件：
    // ax.post(`/api/v1/articles/${articleID}/like`).then((resp) => {
    //   console.log(resp.data) 
    // })
  }
}
