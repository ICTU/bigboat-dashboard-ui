let Article, Box, Header, Heading, Icons, List, ListItem, Paragraph, Search, Sidebar, Split, Title;
const React = require('react');

({ Article, Box, Header, Heading, Search, Title, Box, Split, Sidebar, Paragraph, Icons, List, ListItem } = require('grommet'));
const { Status } = Icons;
const DataStoreUsageMeter = require('../viz/DataStoreUsageMeter');
const DataBucketsList = require('../lists/DataBucketsList');
const Loading = require('../Loading');
const createReactClass = require("create-react-class");

module.exports = createReactClass({
  displayName: 'ResourcesPage',

  render: function() { 
    return <Loading isLoading={this.props.isLoading} render={this.renderWithData} />
  },
  renderWithData: function() {
    const services = this.props.services
    return (
      <Split flex='left' priority='left'>
        <Article>
            <Header fixed={true} pad='medium' justify='between'>
              <Box justify='start' direction='row'>
                <Title responsive={true} truncate={true}>Resources Overview</Title>
              </Box>
            </Header>
            <List>
            {this.props.services && this.props.services.map((service, i) =>
                <ListItem key={i}>
                  <Box direction='row' align='center' >
                    <Status value={service.isUp ? 'ok' : 'warning'}/>
                    <Box direction='column' pad='small'>
                      <strong>{service.name}</strong>
                      <span dangerouslySetInnerHTML={{__html:service.description}}></span>
                    </Box>
                  </Box>
                </ListItem>
              )
              }
            </List>
        </Article>
        <Sidebar size='medium' colorIndex='light-2' direction='column'>
          <Box align='center' justify='center' direction='column'>
            <Header pad='medium' size='large' direction='column'>
              <Title><Icons.Base.Info /></Title>
              <Paragraph align='center'>
                This page lists the availability of all resources and their status.
              </Paragraph>
            </Header>

          </Box>
        </Sidebar>
      </Split>
    )
  }
})