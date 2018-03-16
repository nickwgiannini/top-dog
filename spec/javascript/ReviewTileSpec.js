import ReviewTile from '../../app/javascript/components/ReviewTile';

describe('ReviewTile', () => {
  let breed,
  user,
  kid_friendly,
  dog_friendly,
  barking_lvl,
  trainability,
  energy_lvl,
  body,
  wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <ReviewTile
        breed = 'b1'
        user = 'u1'
        kid_friendly = '6'
        dog_friendly = '9'
        barking_lvl = '3'
        trainability = '8'
        energy_lvl = '6'
        body = "great dog"
      />
    );
  });
})
