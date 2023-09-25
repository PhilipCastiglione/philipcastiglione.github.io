'use strict';

const e = React.createElement;

class Cuteness extends React.Component {
  constructor(props) {
    super(props);
    this.state = { reveal: false };
  }

  render() {
    if (this.state.reveal) {
      return 'Gráinne';
    }

    return e(
      'button',
      { onClick: () => this.setState({ reveal: true }) },
      'Who is cute?'
    );
  }
}

const domContainer = document.querySelector('#cuteness_container');
const root = ReactDOM.createRoot(domContainer);
root.render(e(Cuteness));