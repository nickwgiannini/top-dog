import BreedShowContainer from '../../app/javascript/containers/BreedShowContainer';
import BreedShowTile from '../../app/javascript/components/BreedShowTile';
import ReviewTile from '../../app/javascript/components/ReviewTile'


describe('BreedShowContainer', () => {
  let wrapper;
  beforeEach(() => {
    wrapper= mount(
      <BreedShowContainer
        params = '1'
      />);
    });

    it('should have the specified initial state', () => {
      expect(wrapper.state()).toEqual({
        breed : {},
        reviews: [],
        messages: [],
        length: 0
      });
    })

    it('renders a header tag', done => {
      setTimeout(() => {
        expect(wrapper.find('h1')).toBePresent();
        done();
      }, 0);
    })

    it('renders a BreedShowTile component', done => {
      setTimeout(() => {
        expect(wrapper.find(BreedShowTile)).toBePresent();
        done();
      }, 0);
    })

    it('should render an ReviewTile Component', () => {
      wrapper.setState({reviews: [{breed: "b1", user: "u1", kid_friendly: 6, dog_friendly: 9, barking_lvl: 3, trainability: 8, energy_lvl: 6, body: "great dog"}
    ]})
    expect(wrapper.find(ReviewTile)).toBePresent();
  });
})
