import BreedsIndexContainer from '../../app/javascript/containers/BreedsIndexContainer';
import BreedIndexTile from '../../app/javascript/components/BreedIndexTile';
import BreedShowContainer from '../../app/javascript/containers/BreedShowContainer';
import BreedShowTile from '../../app/javascript/components/BreedShowTile';


describe('BreedShowContainer', () => {
  debugger
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
      reviews: []
    });
  })
})
