-- CreateTable
CREATE TABLE `SavedCart` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `checkoutToken` VARCHAR(191) NOT NULL,
    `productIds` JSON NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `SavedCart_checkoutToken_key`(`checkoutToken`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
