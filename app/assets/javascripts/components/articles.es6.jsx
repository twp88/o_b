class Articles extends React.Component{
  constructor(props) {
    super(props)

    this.state = {
      articles: this.props.articles
    }
  }
  render () {
    return (
      <div className='articles'>
        <Article articles={this.state.articles} />
      </div>
    )}
  }
