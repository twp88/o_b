class ArticleShow extends React.Component{
  constructor(props) {
    super(props)

    this.state = {
      article: this.props.article
    }
  }
  render () {
    return (
      <div className='article' >
        <h1>{ this.state.article.title }</h1>
        <h3>{ this.state.article.description }</h3>
        <p>{ this.state.article.act_text }</p>
      </div>
    )
  }
}
