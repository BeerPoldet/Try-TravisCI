configs = {
  :apple_id => "poldet.bot@gmail.com",
  :itc_team_id => "118399152",
  :team_id => "F6395XL53N",
  :debug => {
    :scheme => "Try-TravisCI-Debug",
    :app_identifier => "assanee.try.travisci.debug",
    :create_tag => -> (build_number) { "v#{build_number}-debug" }
  },
  :beta => {
    :scheme => "Try-TravisCI-Beta",
    :app_identifier => "assanee.try.travisci.beta",
    :create_tag => -> (build_number) { "v#{build_number}-beta" }
  },
  :prod => {
    :scheme => "Try-TravisCI-Release",
    :app_identifier => "assanee.try.travisci.release",
    :create_tag => -> (build_number) { "v#{build_number}" }
  },
  :provisioningProfiles => { 
    "assanee.try.travisci.debug" => "TryTravisCI",
    "assanee.try.travisci.beta" => "TryTravisCI",
    "assanee.try.travisci.release" => "TryTravisCI"
  }
}