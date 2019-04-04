package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.DonatedItem;

public interface DonatedItemRepository extends JpaRepository <DonatedItem, Long> {
}
