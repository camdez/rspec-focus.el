Feature: Toggle focus tag
  As an Rspec & Emacs user
  In order to quickly focus on a certain test
  I want to be able to toggle the 'focus' tag with a keystoke

  Background:
    Given I am in buffer "foo_spec.rb"
    And the buffer is empty

  Scenario: No focus tag
    Given I insert:
      """
      describe Bowling do
        it "returns 0 for all gutter game" do
          bowling = Bowling.new
          20.times { bowling.hit(0) }
          bowling.score.should eq(0)
        end
      end
      """
    And I place the cursor before "Bowling.new"
    And I invoke rspec-focus-toggle
    Then I should see "it "returns 0 for all gutter game", focus: true do"

  Scenario: No focus tag (single quotes)
    Given I insert:
      """
      describe Bowling do
        it 'returns 0 for all gutter game' do
          bowling = Bowling.new
          20.times { bowling.hit(0) }
          bowling.score.should eq(0)
        end
      end
      """
    And I place the cursor before "Bowling.new"
    And I invoke rspec-focus-toggle
    Then I should see "it 'returns 0 for all gutter game', focus: true do"

  Scenario: Existing focus tag
    Given I insert:
      """
      describe Bowling do
        it 'returns 0 for all gutter game', focus: true do
          bowling = Bowling.new
          20.times { bowling.hit(0) }
          bowling.score.should eq(0)
        end
      end
      """
    And I place the cursor before "Bowling.new"
    And I invoke rspec-focus-toggle
    Then I should see "it 'returns 0 for all gutter game' do"

  Scenario: Existing focus tag, hashrocket with funky whitespace
    Given I insert:
      """
      describe Bowling do
        it 'returns 0 for all gutter game', :focus   =>	true do
          bowling = Bowling.new
          20.times { bowling.hit(0) }
          bowling.score.should eq(0)
        end
      end
      """
    And I place the cursor before "Bowling.new"
    And I invoke rspec-focus-toggle
    Then I should see "it 'returns 0 for all gutter game' do"
