import { Controller } from "stimulus"
import ax from "lib/http/client"

export default class extends Controller {
  like_article(){
    const articleID = this.element.dataset.articleId
    // console.log(articleID)
    // 打 API 到 POST /api/v1/articles/:id/like
    ax.post(`/api/v1/articles/${articleID}/like`).then((resp) => {
      console.log(resp.data) 
    })
  }
}
