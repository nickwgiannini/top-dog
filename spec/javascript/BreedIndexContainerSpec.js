import BreedsIndexContainer from '../../app/javascript/containers/BreedsIndexContainer';
import BreedIndexTile from '../../app/javascript/components/BreedIndexTile';

describe('BreedsIndexContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper= mount(<BreedsIndexContainer />);
  });

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({breeds : []});
  })

  it('should render an BreedIndexTile Component', () => {
    wrapper.setState({breeds: [{id: "1", name:"pug", img_url: "www.amazon.com"}
  ]})
  expect(wrapper.find(BreedIndexTile)).toBePresent();
});
})
