import BreedIndexTile from '../../app/javascript/components/BreedIndexTile';

describe('BreedIndexTile', () => {
  let id,
  name,
  img_url,
  wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <BreedIndexTile
        id = "1"
        name="pug"
        img_url="http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12225427/Pug-Care.jpg"
      />
    )
  });

  it('renders a paragraph tag', done => {
    setTimeout(() => {
      expect(wrapper.find('p')).toBePresent();
      done();
    }, 0);
  })

  it('renders a paragraph tag with the dog name', done => {
    setTimeout(() => {
      expect(wrapper.find('p')).toHaveText("pug");
      done();
    }, 0);
  })

  it('renders an img tag', done => {
    setTimeout(() => {
      expect(wrapper.find('img')).toBePresent();
      done();
    }, 0);
  })


  it("renders a link that takes user to dog's show page", done => {
    setTimeout(() => {
      expect(wrapper.find('Link')).toBeDefined('/breeds/1');
      done();
    }, 0);
  })

})
