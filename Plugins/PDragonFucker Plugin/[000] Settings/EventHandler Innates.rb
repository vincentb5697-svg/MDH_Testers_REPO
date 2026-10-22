EventHandlers.add(:on_player_step_taken, :hatch_eggs,
  proc {
    $player.party.each do |egg|
      next if egg.steps_to_hatch <= 0
      egg.steps_to_hatch -= 1
      $player.pokemon_party.each do |pkmn|
        next if !pkmn.active_innates&.include?(:FLAMEBODY) && !pkmn.active_innates&.include?(:MAGMAARMOR) && !pkmn.active_innates&.include?(:STEAMENGINE) && !pkmn.active_innates&.include?(:EXFLAMEBODY)
        if pkmn.active_innates&.include?(:FLAMEBODY) || pkmn.active_innates&.include?(:MAGMAARMOR) || pkmn.active_innates&.include?(:STEAMENGINE)
          egg.steps_to_hatch -= 1
        end
        if pkmn.active_innates&.include?(:EXFLAMEBODY)
          egg.steps_to_hatch -= 3
        end
        break
      end
      if egg.steps_to_hatch <= 0
        egg.steps_to_hatch = 0
        pbHatch(egg)
      end
    end
  }
)
